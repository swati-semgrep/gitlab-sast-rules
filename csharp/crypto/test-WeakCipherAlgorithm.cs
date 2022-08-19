// License: LGPL-3.0 License (c) security-code-scan
using System.Security.Cryptography;

class WeakCipherAlgorithm
{
  static void DES()
  {
    DES provider = System.Security.Cryptography.DES.Create();
    DES provider1 = DES.Create();

    var provider2 = new DESCryptoServiceProvider();
  }

  static void TripleDES()
  {
    TripleDES provider = System.Security.Cryptography.TripleDES.Create();
    TripleDES provider1 = TripleDES.Create();

    var provider2 = new TripleDESCryptoServiceProvider();
  }

  static void RC2()
  {
    RC2 provider = System.Security.Cryptography.RC2.Create();
    RC2 provider1 = RC2.Create();

    var provider2 = new RC2CryptoServiceProvider();
  }
}