import 'package:flutter/material.dart';

import '../../data/database/models/AssetModel.dart';
import '../widgets/app_secondary_shell.dart';

class AssetDetailScreen extends StatelessWidget {
  const AssetDetailScreen({super.key});

  static const Color primary = Color(0xFF16C8A0);
  static const Color lightBg = Color(0xFFEAF6EE);

  @override
  Widget build(BuildContext context) {
    final asset = ModalRoute.of(context)?.settings.arguments as AssetModel?;

    return AppSecondaryShell(
      primaryColor: primary,
      header: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 18, 20, 18),
                      child: Row(
                        children: [
                          const BackButton(color: Colors.white),
                          Expanded(
                            child: Text(
                              asset?.assetName ?? 'Tài Sản',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF113939),
                              ),
                            ),
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.edit_outlined,
                                color: Color(0xFF103D3D),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.delete_outline,
                                color: Color(0xFF103D3D),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
      body: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
                        decoration: const BoxDecoration(
                          color: lightBg,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _valueRow(
                              'Giá Trị Ban Đầu',
                              (asset?.amount ?? 0) * 0.9,
                            ),
                            const SizedBox(height: 12),
                            _valueRow('Giá Trị Hiện Tại', asset?.amount ?? 0),
                            const SizedBox(height: 18),
                            _fieldChip('Loại', asset?.description ?? ''),
                            const SizedBox(height: 10),
                            _fieldChip('Ghi Chú', asset?.description ?? ''),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(top: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.5),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.bar_chart_rounded,
                                    size: 72,
                                    color: Color(0xFF1D6FFF),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
    );
  }

  Widget _valueRow(String label, double value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(
          value.toStringAsFixed(2),
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: Color(0xFF16C8A0),
          ),
        ),
      ],
    );
  }

  Widget _fieldChip(String label, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text('$label: $value'),
    );
  }
}
