data class Complex(val real: Double, val imag: Double) {
    operator fun plus(c: Complex) =
        Complex(real + c.real, imag + c.imag)

    operator fun minus(c: Complex) =
        Complex(real - c.real, imag - c.imag)

    operator fun times(c: Complex) =
        Complex(real * c.real - imag * c.imag, real * c.imag + imag * c.real)

    operator fun div(c: Complex): Complex {
        val denom = c.real * c.real + c.imag * c.imag
        return Complex(
            (real * c.real + imag * c.imag) / denom,
            (imag * c.real - real * c.imag) / denom
        )
    }

    override fun toString() = "$real + ${imag}i"
}
