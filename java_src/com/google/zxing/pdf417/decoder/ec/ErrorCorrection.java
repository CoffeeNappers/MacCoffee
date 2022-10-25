package com.google.zxing.pdf417.decoder.ec;

import com.google.zxing.ChecksumException;
/* loaded from: classes2.dex */
public final class ErrorCorrection {
    private final ModulusGF field = ModulusGF.PDF417_GF;

    public int decode(int[] received, int numECCodewords, int[] erasures) throws ChecksumException {
        ModulusPoly poly = new ModulusPoly(this.field, received);
        int[] S = new int[numECCodewords];
        boolean error = false;
        for (int i = numECCodewords; i > 0; i--) {
            int eval = poly.evaluateAt(this.field.exp(i));
            S[numECCodewords - i] = eval;
            if (eval != 0) {
                error = true;
            }
        }
        if (!error) {
            return 0;
        }
        ModulusPoly knownErrors = this.field.getOne();
        if (erasures != null) {
            for (int erasure : erasures) {
                int b = this.field.exp((received.length - 1) - erasure);
                ModulusPoly term = new ModulusPoly(this.field, new int[]{this.field.subtract(0, b), 1});
                knownErrors = knownErrors.multiply(term);
            }
        }
        ModulusPoly syndrome = new ModulusPoly(this.field, S);
        ModulusPoly[] sigmaOmega = runEuclideanAlgorithm(this.field.buildMonomial(numECCodewords, 1), syndrome, numECCodewords);
        ModulusPoly sigma = sigmaOmega[0];
        ModulusPoly omega = sigmaOmega[1];
        int[] errorLocations = findErrorLocations(sigma);
        int[] errorMagnitudes = findErrorMagnitudes(omega, sigma, errorLocations);
        for (int i2 = 0; i2 < errorLocations.length; i2++) {
            int position = (received.length - 1) - this.field.log(errorLocations[i2]);
            if (position < 0) {
                throw ChecksumException.getChecksumInstance();
            }
            received[position] = this.field.subtract(received[position], errorMagnitudes[i2]);
        }
        return errorLocations.length;
    }

    private ModulusPoly[] runEuclideanAlgorithm(ModulusPoly a, ModulusPoly b, int R) throws ChecksumException {
        if (a.getDegree() < b.getDegree()) {
            a = b;
            b = a;
        }
        ModulusPoly rLast = a;
        ModulusPoly r = b;
        ModulusPoly tLast = this.field.getZero();
        ModulusPoly t = this.field.getOne();
        while (r.getDegree() >= R / 2) {
            ModulusPoly rLastLast = rLast;
            ModulusPoly tLastLast = tLast;
            rLast = r;
            tLast = t;
            if (rLast.isZero()) {
                throw ChecksumException.getChecksumInstance();
            }
            r = rLastLast;
            ModulusPoly q = this.field.getZero();
            int denominatorLeadingTerm = rLast.getCoefficient(rLast.getDegree());
            int dltInverse = this.field.inverse(denominatorLeadingTerm);
            while (r.getDegree() >= rLast.getDegree() && !r.isZero()) {
                int degreeDiff = r.getDegree() - rLast.getDegree();
                int scale = this.field.multiply(r.getCoefficient(r.getDegree()), dltInverse);
                q = q.add(this.field.buildMonomial(degreeDiff, scale));
                r = r.subtract(rLast.multiplyByMonomial(degreeDiff, scale));
            }
            t = q.multiply(tLast).subtract(tLastLast).negative();
        }
        int sigmaTildeAtZero = t.getCoefficient(0);
        if (sigmaTildeAtZero == 0) {
            throw ChecksumException.getChecksumInstance();
        }
        int inverse = this.field.inverse(sigmaTildeAtZero);
        ModulusPoly sigma = t.multiply(inverse);
        ModulusPoly omega = r.multiply(inverse);
        return new ModulusPoly[]{sigma, omega};
    }

    private int[] findErrorLocations(ModulusPoly errorLocator) throws ChecksumException {
        int numErrors = errorLocator.getDegree();
        int[] result = new int[numErrors];
        int e = 0;
        for (int i = 1; i < this.field.getSize() && e < numErrors; i++) {
            if (errorLocator.evaluateAt(i) == 0) {
                result[e] = this.field.inverse(i);
                e++;
            }
        }
        if (e != numErrors) {
            throw ChecksumException.getChecksumInstance();
        }
        return result;
    }

    private int[] findErrorMagnitudes(ModulusPoly errorEvaluator, ModulusPoly errorLocator, int[] errorLocations) {
        int errorLocatorDegree = errorLocator.getDegree();
        int[] formalDerivativeCoefficients = new int[errorLocatorDegree];
        for (int i = 1; i <= errorLocatorDegree; i++) {
            formalDerivativeCoefficients[errorLocatorDegree - i] = this.field.multiply(i, errorLocator.getCoefficient(i));
        }
        ModulusPoly formalDerivative = new ModulusPoly(this.field, formalDerivativeCoefficients);
        int s = errorLocations.length;
        int[] result = new int[s];
        for (int i2 = 0; i2 < s; i2++) {
            int xiInverse = this.field.inverse(errorLocations[i2]);
            int numerator = this.field.subtract(0, errorEvaluator.evaluateAt(xiInverse));
            int denominator = this.field.inverse(formalDerivative.evaluateAt(xiInverse));
            result[i2] = this.field.multiply(numerator, denominator);
        }
        return result;
    }
}
