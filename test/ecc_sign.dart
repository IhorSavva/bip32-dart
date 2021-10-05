import 'dart:convert';
import 'dart:typed_data';
import 'package:bip32_defichain/bip32.dart';
import 'package:hex/hex.dart';
import 'package:test/test.dart';
import '../lib/src/utils/ecurve.dart' as ecc;

final defichain_testnet = NetworkType(bip32: Bip32Type(private: 0x04358394, public: 0x043587cf), wif: 0xef);

void main() {
  group("curve test", () {
    test("test sign", () {
      var privArra = Uint8List.fromList(
          [13, 255, 118, 1, 213, 120, 252, 189, 147, 183, 212, 129, 212, 200, 196, 203, 235, 133, 92, 90, 70, 96, 130, 185, 232, 102, 123, 118, 65, 28, 208, 167]);

      var signed = ecc.sign(HEX.decode("8849e6f51b454f65e38279004919f44f663ace1c53e86dce065840d3e6afedb4") as Uint8List, privArra);

      var signedBase64 = base64Encode(ecc.encodeSignature(signed, 0, true));

      expect("H7tV5q32uRwtzzVSGcrfiHMKAlCCkHUwNK7iu+cZ5XctQCWXu552gNAliqGoZkh7/mi4Ps9AlXUzo4fgfRre9R0=", signedBase64);
    });
  });
}
