import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../controllers/item_actions_provider.dart';
import '../models/item_enums.dart';
import '../models/item_model.dart';
import '../models/item_request_model.dart';

/// Tela de formulário para criação ou edição de um item.
///
/// Quando [itemParaEditar] é fornecido, opera em modo edição (PUT).
/// Caso contrário, opera em modo criação (POST).
class ItemFormView extends ConsumerStatefulWidget {
  const ItemFormView({super.key, this.itemParaEditar});

  /// Quando não-nulo, pré-preenche o formulário e usa [atualizarItem].
  final ItemModel? itemParaEditar;

  @override
  ConsumerState<ItemFormView> createState() => _ItemFormViewState();
}

class _ItemFormViewState extends ConsumerState<ItemFormView> {
  final _formKey = GlobalKey<FormState>();

  // Controllers de texto
  late final TextEditingController _tituloCtrl;
  late final TextEditingController _descricaoCtrl;
  late final TextEditingController _localCtrl;
  late final TextEditingController _dataCtrl;
  late final TextEditingController _nomeCtrl;
  late final TextEditingController _telefoneCtrl;
  late final TextEditingController _imagemCtrl;
  late final TextEditingController _observacaoCtrl;

  // Valores dos dropdowns
  late TipoItem _tipo;
  late CategoriaItem _categoria;

  bool get _isEditing => widget.itemParaEditar != null;

  @override
  void initState() {
    super.initState();
    final item = widget.itemParaEditar;
    _tituloCtrl = TextEditingController(text: item?.titulo ?? '');
    _descricaoCtrl = TextEditingController(text: item?.descricao ?? '');
    _localCtrl = TextEditingController(text: item?.local ?? '');
    _dataCtrl = TextEditingController(text: item?.dataOcorrido ?? '');
    _nomeCtrl = TextEditingController(text: item?.nomeContato ?? '');
    _telefoneCtrl = TextEditingController(text: item?.telefoneContato ?? '');
    _imagemCtrl = TextEditingController(text: item?.imagemUrl ?? '');
    _observacaoCtrl = TextEditingController(text: item?.observacao ?? '');
    _tipo = item?.tipo ?? TipoItem.PERDIDO;
    _categoria = item?.categoria ?? CategoriaItem.OUTROS;
  }

  @override
  void dispose() {
    for (final c in [
      _tituloCtrl,
      _descricaoCtrl,
      _localCtrl,
      _dataCtrl,
      _nomeCtrl,
      _telefoneCtrl,
      _imagemCtrl,
      _observacaoCtrl,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  // ── Ação de salvar ────────────────────────────────────────
  Future<void> _salvar() async {
    if (!_formKey.currentState!.validate()) return;

    final request = ItemRequestModel(
      titulo: _tituloCtrl.text.trim(),
      descricao: _descricaoCtrl.text.trim(),
      tipo: _tipo,
      categoria: _categoria,
      local: _localCtrl.text.trim(),
      dataOcorrido: _dataCtrl.text.trim(),
      nomeContato: _nomeCtrl.text.trim(),
      telefoneContato: _telefoneCtrl.text.trim(),
      imagemUrl: _imagemCtrl.text.trim().isEmpty
          ? null
          : _imagemCtrl.text.trim(),
      observacao: _observacaoCtrl.text.trim().isEmpty
          ? null
          : _observacaoCtrl.text.trim(),
    );

    final notifier = ref.read(itemActionsNotifierProvider.notifier);
    final bool ok;

    if (_isEditing) {
      ok = await notifier.atualizarItem(widget.itemParaEditar!.id, request);
    } else {
      ok = await notifier.criarItem(request);
    }

    if (ok && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_isEditing
              ? 'Item atualizado com sucesso!'
              : 'Item cadastrado com sucesso!'),
        ),
      );
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final actionState = ref.watch(itemActionsNotifierProvider);
    final isLoading = actionState is ActionLoading;

    // Exibe erros da API no SnackBar
    ref.listen(itemActionsNotifierProvider, (_, next) {
      if (next is ActionError<ItemModel?>) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.mensagem),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Editar Item' : 'Novo Item'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
          children: [
            // ── Tipo ─────────────────────────────────────────
            _SectionLabel('Tipo de ocorrência'),
            const SizedBox(height: 8),
            SegmentedButton<TipoItem>(
              segments: const [
                ButtonSegment(
                  value: TipoItem.PERDIDO,
                  label: Text('Perdido'),
                  icon: Icon(Icons.help_outline_rounded),
                ),
                ButtonSegment(
                  value: TipoItem.ACHADO,
                  label: Text('Achado'),
                  icon: Icon(Icons.search_rounded),
                ),
              ],
              selected: {_tipo},
              onSelectionChanged: (s) => setState(() => _tipo = s.first),
            ),

            const SizedBox(height: 20),

            // ── Título ───────────────────────────────────────
            _SectionLabel('Informações do Item'),
            const SizedBox(height: 10),
            _campo(
              controller: _tituloCtrl,
              label: 'Título',
              hint: 'Ex: Carteira preta com documentos',
              validator: (v) {
                if (v == null || v.trim().length < 3) {
                  return 'Mínimo de 3 caracteres';
                }
                if (v.trim().length > 100) return 'Máximo de 100 caracteres';
                return null;
              },
            ),
            const SizedBox(height: 12),

            // ── Descrição ────────────────────────────────────
            _campo(
              controller: _descricaoCtrl,
              label: 'Descrição',
              hint: 'Detalhe o objeto, características marcantes…',
              maxLines: 3,
              maxLength: 1000,
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Campo obrigatório';
                return null;
              },
            ),
            const SizedBox(height: 12),

            // ── Categoria ────────────────────────────────────
            DropdownButtonFormField<CategoriaItem>(
              initialValue: _categoria,
              decoration: const InputDecoration(
                labelText: 'Categoria',
                prefixIcon: Icon(Icons.category_outlined),
              ),
              items: CategoriaItem.values.map((c) {
                return DropdownMenuItem(
                  value: c,
                  child: Text(_categoriaLabel(c)),
                );
              }).toList(),
              onChanged: (v) => setState(() => _categoria = v!),
            ),
            const SizedBox(height: 12),

            // ── Local ────────────────────────────────────────
            _campo(
              controller: _localCtrl,
              label: 'Local',
              hint: 'Ex: Bloco A, sala 102',
              prefixIcon: Icons.location_on_outlined,
              maxLength: 150,
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Campo obrigatório' : null,
            ),
            const SizedBox(height: 12),

            // ── Data ─────────────────────────────────────────
            TextFormField(
              controller: _dataCtrl,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Data da ocorrência',
                hintText: 'AAAA-MM-DD',
                prefixIcon: Icon(Icons.calendar_today_outlined),
              ),
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                );
                if (picked != null) {
                  final formatted =
                      '${picked.year.toString().padLeft(4, '0')}-'
                      '${picked.month.toString().padLeft(2, '0')}-'
                      '${picked.day.toString().padLeft(2, '0')}';
                  _dataCtrl.text = formatted;
                }
              },
              validator: (v) =>
                  (v == null || v.isEmpty) ? 'Selecione a data' : null,
            ),

            const SizedBox(height: 20),

            // ── Contato ──────────────────────────────────────
            _SectionLabel('Informações de Contato'),
            const SizedBox(height: 10),
            _campo(
              controller: _nomeCtrl,
              label: 'Nome do contato',
              prefixIcon: Icons.person_outlined,
              maxLength: 100,
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Campo obrigatório' : null,
            ),
            const SizedBox(height: 12),
            _campo(
              controller: _telefoneCtrl,
              label: 'Telefone',
              hint: '(xx) 9xxxx-xxxx',
              prefixIcon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
              maxLength: 20,
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Campo obrigatório' : null,
            ),

            const SizedBox(height: 20),

            // ── Opcionais ────────────────────────────────────
            _SectionLabel('Campos Opcionais'),
            const SizedBox(height: 10),
            _campo(
              controller: _imagemCtrl,
              label: 'URL da imagem (opcional)',
              prefixIcon: Icons.image_outlined,
              keyboardType: TextInputType.url,
              maxLength: 500,
            ),
            const SizedBox(height: 12),
            _campo(
              controller: _observacaoCtrl,
              label: 'Observação (opcional)',
              maxLines: 2,
              maxLength: 500,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(
            20, 12, 20, 12 + MediaQuery.of(context).viewPadding.bottom),
        child: FilledButton.icon(
          onPressed: isLoading ? null : _salvar,
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
          ),
          icon: isLoading
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                      strokeWidth: 2, color: Colors.white),
                )
              : Icon(_isEditing ? Icons.save_rounded : Icons.add_rounded),
          label: Text(_isEditing ? 'Salvar alterações' : 'Cadastrar item'),
        ),
      ),
    );
  }

  // ── Helper: campo de texto padrão ─────────────────────────
  Widget _campo({
    required TextEditingController controller,
    required String label,
    String? hint,
    IconData? prefixIcon,
    int maxLines = 1,
    int? maxLength,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      maxLength: maxLength,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      ),
      validator: validator,
    );
  }

  String _categoriaLabel(CategoriaItem cat) {
    return switch (cat) {
      CategoriaItem.DOCUMENTOS => 'Documentos',
      CategoriaItem.ELETRONICOS => 'Eletrônicos',
      CategoriaItem.ROUPAS => 'Roupas',
      CategoriaItem.MATERIAL_ESCOLAR => 'Material Escolar',
      CategoriaItem.CHAVES => 'Chaves',
      CategoriaItem.ACESSORIOS => 'Acessórios',
      CategoriaItem.OUTROS => 'Outros',
    };
  }
}

// ── Widget auxiliar ────────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
