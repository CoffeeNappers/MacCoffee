package com.google.zxing.client.result;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.Result;
import com.google.zxing.oned.UPCEReader;
/* loaded from: classes2.dex */
public final class ProductResultParser extends ResultParser {
    @Override // com.google.zxing.client.result.ResultParser
    /* renamed from: parse  reason: collision with other method in class */
    public ProductParsedResult mo430parse(Result result) {
        String normalizedProductID;
        BarcodeFormat format = result.getBarcodeFormat();
        if (format == BarcodeFormat.UPC_A || format == BarcodeFormat.UPC_E || format == BarcodeFormat.EAN_8 || format == BarcodeFormat.EAN_13) {
            String rawText = getMassagedText(result);
            if (!isStringOfDigits(rawText, rawText.length())) {
                return null;
            }
            if (format == BarcodeFormat.UPC_E && rawText.length() == 8) {
                normalizedProductID = UPCEReader.convertUPCEtoUPCA(rawText);
            } else {
                normalizedProductID = rawText;
            }
            return new ProductParsedResult(rawText, normalizedProductID);
        }
        return null;
    }
}
