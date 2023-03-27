import '../../commons.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    required this.onRetry,
  });

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: const Icon(Icons.priority_high_outlined),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Não foi possível carregar a página.\nClique no botão para atualizar.',
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              CustomFilledButtom(
                text: 'Atualizar página',
                size: CustomFilledButtomSize.large,
                onPressed: () {
                  Navigator.of(context).pop();
                  onRetry();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
