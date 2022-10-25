package com.google.zxing.pdf417.decoder;

import com.google.zxing.FormatException;
import com.google.zxing.ResultPoint;
/* loaded from: classes2.dex */
final class DetectionResultRowIndicatorColumn extends DetectionResultColumn {
    private final boolean isLeft;

    /* JADX INFO: Access modifiers changed from: package-private */
    public DetectionResultRowIndicatorColumn(BoundingBox boundingBox, boolean isLeft) {
        super(boundingBox);
        this.isLeft = isLeft;
    }

    void setRowNumbers() {
        Codeword[] arr$ = getCodewords();
        for (Codeword codeword : arr$) {
            if (codeword != null) {
                codeword.setRowNumberAsRowIndicatorColumn();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int adjustCompleteIndicatorColumnRowNumbers(BarcodeMetadata barcodeMetadata) {
        int checkedRows;
        Codeword[] codewords = getCodewords();
        setRowNumbers();
        removeIncorrectCodewords(codewords, barcodeMetadata);
        BoundingBox boundingBox = getBoundingBox();
        ResultPoint top = this.isLeft ? boundingBox.getTopLeft() : boundingBox.getTopRight();
        ResultPoint bottom = this.isLeft ? boundingBox.getBottomLeft() : boundingBox.getBottomRight();
        int firstRow = imageRowToCodewordIndex((int) top.getY());
        int lastRow = imageRowToCodewordIndex((int) bottom.getY());
        float averageRowHeight = (lastRow - firstRow) / barcodeMetadata.getRowCount();
        int barcodeRow = -1;
        int maxRowHeight = 1;
        int currentRowHeight = 0;
        int codewordsRow = firstRow;
        while (codewordsRow < lastRow) {
            if (codewords[codewordsRow] != null) {
                Codeword codeword = codewords[codewordsRow];
                int rowDifference = codeword.getRowNumber() - barcodeRow;
                if (rowDifference == 0) {
                    currentRowHeight++;
                } else if (rowDifference == 1) {
                    maxRowHeight = Math.max(maxRowHeight, currentRowHeight);
                    currentRowHeight = 1;
                    barcodeRow = codeword.getRowNumber();
                } else if (rowDifference < 0 || codeword.getRowNumber() >= barcodeMetadata.getRowCount() || rowDifference > codewordsRow) {
                    codewords[codewordsRow] = null;
                } else {
                    if (maxRowHeight > 2) {
                        checkedRows = (maxRowHeight - 2) * rowDifference;
                    } else {
                        checkedRows = rowDifference;
                    }
                    boolean closePreviousCodewordFound = checkedRows >= codewordsRow;
                    for (int i = 1; i <= checkedRows && !closePreviousCodewordFound; i++) {
                        closePreviousCodewordFound = codewords[codewordsRow - i] != null;
                    }
                    if (closePreviousCodewordFound) {
                        codewords[codewordsRow] = null;
                    } else {
                        barcodeRow = codeword.getRowNumber();
                        currentRowHeight = 1;
                    }
                }
            }
            codewordsRow++;
        }
        return (int) (averageRowHeight + 0.5d);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int[] getRowHeights() throws FormatException {
        BarcodeMetadata barcodeMetadata = getBarcodeMetadata();
        if (barcodeMetadata == null) {
            return null;
        }
        adjustIncompleteIndicatorColumnRowNumbers(barcodeMetadata);
        int[] result = new int[barcodeMetadata.getRowCount()];
        Codeword[] arr$ = getCodewords();
        for (Codeword codeword : arr$) {
            if (codeword != null) {
                int rowNumber = codeword.getRowNumber();
                if (rowNumber >= result.length) {
                    throw FormatException.getFormatInstance();
                }
                result[rowNumber] = result[rowNumber] + 1;
            }
        }
        return result;
    }

    int adjustIncompleteIndicatorColumnRowNumbers(BarcodeMetadata barcodeMetadata) {
        BoundingBox boundingBox = getBoundingBox();
        ResultPoint top = this.isLeft ? boundingBox.getTopLeft() : boundingBox.getTopRight();
        ResultPoint bottom = this.isLeft ? boundingBox.getBottomLeft() : boundingBox.getBottomRight();
        int firstRow = imageRowToCodewordIndex((int) top.getY());
        int lastRow = imageRowToCodewordIndex((int) bottom.getY());
        float averageRowHeight = (lastRow - firstRow) / barcodeMetadata.getRowCount();
        Codeword[] codewords = getCodewords();
        int barcodeRow = -1;
        int maxRowHeight = 1;
        int currentRowHeight = 0;
        for (int codewordsRow = firstRow; codewordsRow < lastRow; codewordsRow++) {
            if (codewords[codewordsRow] != null) {
                Codeword codeword = codewords[codewordsRow];
                codeword.setRowNumberAsRowIndicatorColumn();
                int rowDifference = codeword.getRowNumber() - barcodeRow;
                if (rowDifference == 0) {
                    currentRowHeight++;
                } else if (rowDifference == 1) {
                    maxRowHeight = Math.max(maxRowHeight, currentRowHeight);
                    currentRowHeight = 1;
                    barcodeRow = codeword.getRowNumber();
                } else if (codeword.getRowNumber() >= barcodeMetadata.getRowCount()) {
                    codewords[codewordsRow] = null;
                } else {
                    barcodeRow = codeword.getRowNumber();
                    currentRowHeight = 1;
                }
            }
        }
        return (int) (averageRowHeight + 0.5d);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public BarcodeMetadata getBarcodeMetadata() {
        Codeword[] codewords = getCodewords();
        BarcodeValue barcodeColumnCount = new BarcodeValue();
        BarcodeValue barcodeRowCountUpperPart = new BarcodeValue();
        BarcodeValue barcodeRowCountLowerPart = new BarcodeValue();
        BarcodeValue barcodeECLevel = new BarcodeValue();
        for (Codeword codeword : codewords) {
            if (codeword != null) {
                codeword.setRowNumberAsRowIndicatorColumn();
                int rowIndicatorValue = codeword.getValue() % 30;
                int codewordRowNumber = codeword.getRowNumber();
                if (!this.isLeft) {
                    codewordRowNumber += 2;
                }
                switch (codewordRowNumber % 3) {
                    case 0:
                        barcodeRowCountUpperPart.setValue((rowIndicatorValue * 3) + 1);
                        continue;
                    case 1:
                        barcodeECLevel.setValue(rowIndicatorValue / 3);
                        barcodeRowCountLowerPart.setValue(rowIndicatorValue % 3);
                        continue;
                    case 2:
                        barcodeColumnCount.setValue(rowIndicatorValue + 1);
                        continue;
                }
            }
        }
        if (barcodeColumnCount.getValue().length == 0 || barcodeRowCountUpperPart.getValue().length == 0 || barcodeRowCountLowerPart.getValue().length == 0 || barcodeECLevel.getValue().length == 0 || barcodeColumnCount.getValue()[0] < 1 || barcodeRowCountUpperPart.getValue()[0] + barcodeRowCountLowerPart.getValue()[0] < 3 || barcodeRowCountUpperPart.getValue()[0] + barcodeRowCountLowerPart.getValue()[0] > 90) {
            return null;
        }
        BarcodeMetadata barcodeMetadata = new BarcodeMetadata(barcodeColumnCount.getValue()[0], barcodeRowCountUpperPart.getValue()[0], barcodeRowCountLowerPart.getValue()[0], barcodeECLevel.getValue()[0]);
        removeIncorrectCodewords(codewords, barcodeMetadata);
        return barcodeMetadata;
    }

    private void removeIncorrectCodewords(Codeword[] codewords, BarcodeMetadata barcodeMetadata) {
        for (int codewordRow = 0; codewordRow < codewords.length; codewordRow++) {
            Codeword codeword = codewords[codewordRow];
            if (codewords[codewordRow] != null) {
                int rowIndicatorValue = codeword.getValue() % 30;
                int codewordRowNumber = codeword.getRowNumber();
                if (codewordRowNumber > barcodeMetadata.getRowCount()) {
                    codewords[codewordRow] = null;
                } else {
                    if (!this.isLeft) {
                        codewordRowNumber += 2;
                    }
                    switch (codewordRowNumber % 3) {
                        case 0:
                            if ((rowIndicatorValue * 3) + 1 != barcodeMetadata.getRowCountUpperPart()) {
                                codewords[codewordRow] = null;
                                break;
                            } else {
                                continue;
                            }
                        case 1:
                            if (rowIndicatorValue / 3 != barcodeMetadata.getErrorCorrectionLevel() || rowIndicatorValue % 3 != barcodeMetadata.getRowCountLowerPart()) {
                                codewords[codewordRow] = null;
                                break;
                            } else {
                                continue;
                            }
                            break;
                        case 2:
                            if (rowIndicatorValue + 1 != barcodeMetadata.getColumnCount()) {
                                codewords[codewordRow] = null;
                                break;
                            } else {
                                continue;
                            }
                    }
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isLeft() {
        return this.isLeft;
    }

    @Override // com.google.zxing.pdf417.decoder.DetectionResultColumn
    public String toString() {
        return "IsLeft: " + this.isLeft + '\n' + super.toString();
    }
}
