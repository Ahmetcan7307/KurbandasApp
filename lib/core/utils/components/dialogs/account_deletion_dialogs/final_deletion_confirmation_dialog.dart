import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kurbandas/generated/l10n.dart';

class FinalDeletionConfirmationDialog extends StatefulWidget {
  const FinalDeletionConfirmationDialog({super.key});

  @override
  State<FinalDeletionConfirmationDialog> createState() =>
      _FinalDeletionConfirmationDialogState();
}

class _FinalDeletionConfirmationDialogState
    extends State<FinalDeletionConfirmationDialog>
    with TickerProviderStateMixin {
  late AnimationController shakeController, fadeController, pulseController;
  late Animation<double> shakeAnimation, fadeAnimation, pulseAnimation;

  TextEditingController confirmationController = TextEditingController();

  bool isTypingCorrect = false, isLoading = false, countdownComplete = false;

  int countdown = 3;

  late S lang;

  late String confirmationText;

  @override
  void initState() {
    super.initState();

    shakeController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    fadeController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    pulseController = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);
    shakeAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: shakeController, curve: Curves.elasticIn));
    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: fadeController, curve: Curves.easeInOut));
    pulseAnimation = Tween<double>(begin: .8, end: 1.2).animate(
        CurvedAnimation(parent: pulseController, curve: Curves.easeInOut));
    fadeController.forward();
    pulseController.repeat(reverse: true);
    startCountDown();
  }

  void startCountDown() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));

      if (mounted) {
        setState(() {
          countdown--;
        });

        if (countdown <= 0) {
          setState(() {
            countdownComplete = true;
          });
          return false;
        }

        return true;
      }

      return false;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    lang = S.of(context);

    confirmationText = lang.delete;
  }

  @override
  void dispose() {
    shakeController.dispose();
    fadeController.dispose();
    pulseController.dispose();
    confirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FadeTransition(
        opacity: fadeAnimation,
        child: AnimatedBuilder(
            animation: shakeAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(
                    20 *
                        shakeAnimation.value *
                        (.5 - (shakeAnimation.value - .5).abs()) *
                        4,
                    0),
                child: Dialog(
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black87,
                              Colors.red.shade900,
                              Colors.black87
                            ]),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                            color: Colors.red.withValues(alpha: .5), width: 2),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.red.withValues(alpha: .4),
                              blurRadius: 25,
                              spreadRadius: 5,
                              offset: const Offset(0, 10))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(28),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Pulsing Icon with proper continuous animation
                          AnimatedBuilder(
                              animation: pulseAnimation,
                              builder: (context, child) {
                                return Transform.scale(
                                  scale: pulseAnimation.value,
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: RadialGradient(colors: [
                                          Colors.red.withValues(alpha: .3),
                                          Colors.transparent
                                        ])),
                                    child: const Icon(
                                      Icons.dangerous,
                                      size: 60,
                                      color: Colors.red,
                                    ),
                                  ),
                                );
                              }),
                          const SizedBox(height: 20),
                          Text(
                            lang.finalWarning,
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.red.shade300,
                                letterSpacing: 2),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.red.withValues(alpha: .3),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    color: Colors.red.withValues(alpha: .3),
                                    width: 1)),
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 32,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  lang.delete_confirm_text,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      height: 1.5,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          if (!countdownComplete) ...[
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.amber.withValues(alpha: .1),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                children: [
                                  Text(
                                    lang.pleaseWait,
                                    style: TextStyle(
                                        color: Colors.amber.shade300,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(height: 12),
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.amber, width: 3)),
                                    child: Center(
                                      child: Text(
                                        countdown.toString(),
                                        style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.amber),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ] else ...[
                            Column(
                              children: [
                                Text(
                                  lang.deleteAccountType(confirmationText),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: isTypingCorrect
                                              ? Colors.red
                                              : Colors.grey.shade600,
                                          width: 2),
                                      boxShadow: isTypingCorrect
                                          ? [
                                              BoxShadow(
                                                  color: Colors.red
                                                      .withValues(alpha: .3),
                                                  blurRadius: 8,
                                                  spreadRadius: 2)
                                            ]
                                          : null),
                                  child: TextField(
                                    controller: confirmationController,
                                    onChanged: onTextChanged,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: isTypingCorrect
                                            ? Colors.red
                                            : Colors.black,
                                        letterSpacing: 2),
                                    decoration: InputDecoration(
                                        hintText: confirmationText,
                                        hintStyle: TextStyle(
                                            color: Colors.grey.shade500,
                                            letterSpacing: 2),
                                        border: InputBorder.none,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 16, horizontal: 20)),
                                  ),
                                )
                              ],
                            )
                          ],
                          const SizedBox(height: 28),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withValues(alpha: .2),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: Colors.grey
                                              .withValues(alpha: .5))),
                                  child: TextButton(
                                      onPressed: isLoading
                                          ? null
                                          : () => Navigator.pop(context, false),
                                      style: TextButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12))),
                                      child: Text(
                                        lang.cancel,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      )),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: isTypingCorrect &&
                                                  countdownComplete
                                              ? [
                                                  Colors.red.shade600,
                                                  Colors.red.shade800
                                                ]
                                              : [
                                                  Colors.grey.shade700,
                                                  Colors.grey.shade800
                                                ]),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: isTypingCorrect &&
                                              countdownComplete
                                          ? [
                                              BoxShadow(
                                                  color: Colors.red
                                                      .withValues(alpha: .5),
                                                  blurRadius: 12,
                                                  offset: const Offset(0, 6))
                                            ]
                                          : null),
                                  child: ElevatedButton(
                                      onPressed: isTypingCorrect &&
                                              countdownComplete &&
                                              !isLoading
                                          ? finalDelete
                                          : shakeDialog,
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12))),
                                      child: isLoading
                                          ? const SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                                strokeWidth: 2,
                                              ))
                                          : Text(
                                              lang.accountDelete,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1),
                                              textAlign: TextAlign.center,
                                            )),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  void onTextChanged(String value) {
    setState(() {
      isTypingCorrect = value == confirmationText;
    });

    if (value == confirmationText) {
      HapticFeedback.heavyImpact();
    }
  }

  Future finalDelete() async {
    setState(() {
      isLoading = true;
    });

    // Add dramatic pause for effect
    await Future.delayed(const Duration(milliseconds: 800));

    if (mounted) {
      Navigator.pop(context, true);
    }
  }

  void shakeDialog() {
    shakeController.reset();
    shakeController.forward();
    HapticFeedback.vibrate();
  }
}
