package com.crashlytics.android.answers;

import com.google.android.exoplayer2.C;
import java.math.BigDecimal;
import java.util.Currency;
/* loaded from: classes.dex */
public class AddToCartEvent extends PredefinedEvent<AddToCartEvent> {
    static final String CURRENCY_ATTRIBUTE = "currency";
    static final String ITEM_ID_ATTRIBUTE = "itemId";
    static final String ITEM_NAME_ATTRIBUTE = "itemName";
    static final String ITEM_PRICE_ATTRIBUTE = "itemPrice";
    static final String ITEM_TYPE_ATTRIBUTE = "itemType";
    static final BigDecimal MICRO_CONSTANT = BigDecimal.valueOf((long) C.MICROS_PER_SECOND);
    static final String TYPE = "addToCart";

    public AddToCartEvent putItemId(String itemId) {
        this.predefinedAttributes.put(ITEM_ID_ATTRIBUTE, itemId);
        return this;
    }

    public AddToCartEvent putItemName(String itemName) {
        this.predefinedAttributes.put(ITEM_NAME_ATTRIBUTE, itemName);
        return this;
    }

    public AddToCartEvent putItemType(String itemType) {
        this.predefinedAttributes.put(ITEM_TYPE_ATTRIBUTE, itemType);
        return this;
    }

    public AddToCartEvent putItemPrice(BigDecimal itemPrice) {
        if (!this.validator.isNull(itemPrice, ITEM_PRICE_ATTRIBUTE)) {
            this.predefinedAttributes.put(ITEM_PRICE_ATTRIBUTE, Long.valueOf(priceToMicros(itemPrice)));
        }
        return this;
    }

    public AddToCartEvent putCurrency(Currency currency) {
        if (!this.validator.isNull(currency, "currency")) {
            this.predefinedAttributes.put("currency", currency.getCurrencyCode());
        }
        return this;
    }

    long priceToMicros(BigDecimal decimal) {
        return MICRO_CONSTANT.multiply(decimal).longValue();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.crashlytics.android.answers.PredefinedEvent
    public String getPredefinedType() {
        return TYPE;
    }
}
