// License: LGPL-3.0 License (c) find-sec-bugs
import scala.util.Random

def generateSecretToken() {
    print(Random.nextBoolean())
    print(Random.nextDouble())
    print(Random.nextFloat())
    print(Random.nextGaussian())
    print(Random.nextInt())
    print(Random.nextLong())
    print(Random.nextPrintableChar())
    print(Random.nextstring(10))
}
