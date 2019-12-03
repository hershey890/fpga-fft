# %%
import numpy as np

N = 16  # N-point FFT
omega = np.array(np.exp(-2j * np.pi * np.arange(N) / N))
(omega_real, omega_imag) = (np.real(omega), np.imag(omega))
# range from (-1,1)->(-2^(N-1)-1 to 2^(N-1)-1). 1 bit for sign bit
(omega_real, omega_imag) = (omega_real * np.power(2, N - 1), omega_imag * np.power(2, N - 1))  #
(omega_real, omega_imag) = (omega_real.astype(dtype=int), omega_imag.astype(dtype=int))  # float->integer
(omega_real_bin, omega_imag_bin) = ([], [])
for i in range(N):
    omega_real_bin.append(np.binary_repr(omega_real[i], N))
    omega_imag_bin.append(np.binary_repr(omega_imag[i], N))

# Print out Values
print('Real')
for i in range(N):
    print('4\'d', end='')
    print(i, end=': ')
    print('twiddle_val <=', end=' 16\'b')
    print(omega_real_bin[i], end=';\n')

print('\nImaginary')
for i in range(N):
    print('4\'d', end='')
    print(i, end=': ')
    print('twiddle_val <=', end=' 16\'b')
    print(omega_imag_bin[i], end=';\n')