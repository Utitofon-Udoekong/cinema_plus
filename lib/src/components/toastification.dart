import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class CPSnackbar {
  static void showSuccess(BuildContext context, String message) {
    
    toastification.show(
                    context: context,
                    type: ToastificationType.success,
                    style: ToastificationStyle.minimal,
                    autoCloseDuration: const Duration(seconds: 4),
                    title: const Text('Success'),
                    description: Text(message),
                    alignment: Alignment.topRight,
                    direction: TextDirection.ltr,
                    animationDuration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    borderRadius: BorderRadius.circular(12),
                    showProgressBar: true,
                    closeOnClick: false,
                    pauseOnHover: false,
                    dragToClose: true,
                    applyBlurEffect: false,
                   
                  );
  }
  static void showError(BuildContext context, String message) {
    
    toastification.show(
                    context: context,
                    type: ToastificationType.error,
                    style: ToastificationStyle.minimal,
                    autoCloseDuration: const Duration(seconds: 4),
                    title: const Text('Error'),
                    description: Text(message), 
                    alignment: Alignment.topRight,
                    direction: TextDirection.ltr,
                    animationDuration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    borderRadius: BorderRadius.circular(12),
                    showProgressBar: true,
                    closeButtonShowType: CloseButtonShowType.onHover,
                    closeOnClick: false,
                    pauseOnHover: false,
                    dragToClose: true,
                    applyBlurEffect: false,
                    
                  );
  }

}
