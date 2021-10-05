import 'dart:convert';
import 'dart:typed_data';
import 'package:bip32_defichain/bip32.dart';
import 'package:bip32_defichain/src/utils/wif.dart';
import 'package:hex/hex.dart';
import 'package:test/test.dart';
import '../lib/src/utils/ecurve.dart' as ecc;

final defichain_testnet = NetworkType(bip32: Bip32Type(private: 0x04358394, public: 0x043587cf), wif: 0xef);

void main() {
  group("curve test", () {
    test("test sign", () {
      var privArra = Uint8List.fromList(
          [13, 255, 118, 1, 213, 120, 252, 189, 147, 183, 212, 129, 212, 200, 196, 203, 235, 133, 92, 90, 70, 96, 130, 185, 232, 102, 123, 118, 65, 28, 208, 167]);

      var signed = ecc.signMessage(HEX.decode("8849e6f51b454f65e38279004919f44f663ace1c53e86dce065840d3e6afedb4") as Uint8List, privArra, true, SegwitType.None);

      var signedBase64 = base64Encode(signed);

      expect("H7tV5q32uRwtzzVSGcrfiHMKAlCCkHUwNK7iu+cZ5XctQCWXu552gNAliqGoZkh7/mi4Ps9AlXUzo4fgfRre9R0=", signedBase64);
    });

    test("test sign2", () {
      var decodeWif = decode("L1MYKXoYaKM2tf6iCiEXAv4J3cAK4GazAUePPVBpBXDqHVqyx2Ff");
      var privArra = decodeWif.privateKey;

      var signed = ecc.signMessage(HEX.decode("1f8e307a8ad4137de8efd7095fd4f0550942ce81ac5ee0cdac6e76cb8c3948b3") as Uint8List, privArra, true, SegwitType.P2SH_P2WPKH);

      var signedBase64 = base64Encode(signed);

      expect("IDZaeRmB7HNNsmyUPNliSqnJQ8IfBi35JHi5e31zvCFtZN10VlV9cxhHUrYDUO7kEPVLweSGTtzuVK6KykcV4l4=", signedBase64);
    });
  });
}
