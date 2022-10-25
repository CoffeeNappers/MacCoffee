package com.vkontakte.android;

import android.content.Context;
import android.os.Parcel;
import android.os.Parcelable;
import com.vkontakte.android.api.models.Model;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.ServerKeys;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import org.json.JSONObject;
import org.slf4j.Marker;
/* loaded from: classes2.dex */
public class MoneyTransfer extends Model implements Parcelable {
    public static final Parcelable.Creator<MoneyTransfer> CREATOR = new Parcelable.Creator<MoneyTransfer>() { // from class: com.vkontakte.android.MoneyTransfer.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public MoneyTransfer mo552createFromParcel(Parcel source) {
            return new MoneyTransfer(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public MoneyTransfer[] mo553newArray(int size) {
            return new MoneyTransfer[size];
        }
    };
    public static final String CURRENCY_KAZAKHSTAN_TENGE = "KZT";
    public static final String CURRENCY_RUSSIAN_ROUBLE = "RUB";
    private static final int KAZAKHSTAN_TENGE_CURRENCY_ID = 398;
    private static final int RUSSIAN_ROUBLE_CURRENCY_ID = 643;
    private static final String SIGN_KAZAKHSTAN_TENGE = "₸";
    private static final String SIGN_RUSSIAN_ROUBLE = "₽";
    public static final int STATUS_CANCELLED = 2;
    public static final int STATUS_COMPLETED = 1;
    public static final int STATUS_PENDING = 0;
    public String acceptUrl;
    public String amount;
    public String comment;
    public int currencyId;
    public String currencyName;
    public int date;
    public CharSequence displayableComment;
    public UserProfile fromUser;
    public int from_id;
    public int id;
    public int status;
    public String text;
    public UserProfile toUser;
    public int to_id;

    public static String getTermsUrl() {
        return "https://m.vk.com/attachments?act=attach_money_about&from_client=1&lang=" + Global.getDeviceLang();
    }

    public static String getLandingUrl() {
        return "https://m.vk.com/landings/moneysend?lang=" + Global.getDeviceLang();
    }

    public MoneyTransfer() {
        this.id = 0;
        this.from_id = 0;
        this.fromUser = null;
        this.toUser = null;
        this.to_id = 0;
        this.status = 0;
        this.date = 0;
        this.amount = "";
        this.text = "";
        this.comment = "";
        this.displayableComment = "";
        this.currencyId = 0;
        this.currencyName = "";
        this.acceptUrl = "";
    }

    public MoneyTransfer(JSONObject jsonObject) {
        this.id = 0;
        this.from_id = 0;
        this.fromUser = null;
        this.toUser = null;
        this.to_id = 0;
        this.status = 0;
        this.date = 0;
        this.amount = "";
        this.text = "";
        this.comment = "";
        this.displayableComment = "";
        this.currencyId = 0;
        this.currencyName = "";
        this.acceptUrl = "";
        try {
            this.id = jsonObject.getInt("id");
            this.from_id = jsonObject.getInt(ServerKeys.FROM_ID);
            this.to_id = jsonObject.getInt("to_id");
            this.status = jsonObject.getInt("status");
            this.date = jsonObject.getInt(ServerKeys.DATE);
            JSONObject jsonAmountObject = jsonObject.getJSONObject(ServerKeys.AMOUNT);
            this.amount = jsonAmountObject.optString(ServerKeys.AMOUNT);
            this.text = jsonAmountObject.optString("text");
            JSONObject jsonCurrencyObject = jsonAmountObject.optJSONObject("currency");
            if (jsonCurrencyObject != null) {
                this.currencyId = jsonCurrencyObject.getInt("id");
                this.currencyName = jsonCurrencyObject.optString("name");
            }
            this.acceptUrl = jsonObject.optString("accept_url");
            this.comment = jsonObject.optString("comment");
            this.displayableComment = Global.replaceEmoji(this.comment);
        } catch (Exception exc) {
            Log.w("vk", "Error parsing MoneyTransfer " + jsonObject, exc);
        }
    }

    protected MoneyTransfer(Parcel in) {
        this.id = 0;
        this.from_id = 0;
        this.fromUser = null;
        this.toUser = null;
        this.to_id = 0;
        this.status = 0;
        this.date = 0;
        this.amount = "";
        this.text = "";
        this.comment = "";
        this.displayableComment = "";
        this.currencyId = 0;
        this.currencyName = "";
        this.acceptUrl = "";
        this.id = in.readInt();
        this.from_id = in.readInt();
        this.to_id = in.readInt();
        this.status = in.readInt();
        this.date = in.readInt();
        this.amount = in.readString();
        this.text = in.readString();
        this.comment = in.readString();
        this.currencyId = in.readInt();
        this.currencyName = in.readString();
        this.acceptUrl = in.readString();
        int haveFromUser = in.readInt();
        if (haveFromUser != 0) {
            this.fromUser = (UserProfile) in.readParcelable(UserProfile.class.getClassLoader());
        }
        int haveToUser = in.readInt();
        if (haveToUser != 0) {
            this.toUser = (UserProfile) in.readParcelable(UserProfile.class.getClassLoader());
        }
        this.displayableComment = Global.replaceEmoji(this.comment);
    }

    public boolean isIncoming() {
        return VKAccountManager.isCurrentUser(this.to_id);
    }

    public UserProfile getPeerUser() {
        return isIncoming() ? this.fromUser : this.toUser;
    }

    public int getPeerId() {
        return isIncoming() ? this.from_id : this.to_id;
    }

    public double getAmountValue() {
        try {
            int amInt = Integer.parseInt(this.amount);
            return amInt / 100.0d;
        } catch (Exception e) {
            return 0.0d;
        }
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int flags) {
        parcel.writeInt(this.id);
        parcel.writeInt(this.from_id);
        parcel.writeInt(this.to_id);
        parcel.writeInt(this.status);
        parcel.writeInt(this.date);
        parcel.writeString(this.amount);
        parcel.writeString(this.text);
        parcel.writeString(this.comment);
        parcel.writeInt(this.currencyId);
        parcel.writeString(this.currencyName);
        parcel.writeString(this.acceptUrl);
        if (this.fromUser == null) {
            parcel.writeInt(0);
        } else {
            parcel.writeInt(1);
            parcel.writeParcelable(this.fromUser, flags);
        }
        if (this.toUser == null) {
            parcel.writeInt(0);
            return;
        }
        parcel.writeInt(1);
        parcel.writeParcelable(this.toUser, flags);
    }

    public String getAmountFormatted() {
        double amountValue = getAmountValue();
        DecimalFormat precision = new DecimalFormat("#,###.##");
        DecimalFormatSymbols symbols = precision.getDecimalFormatSymbols();
        symbols.setGroupingSeparator((char) 160);
        precision.setDecimalFormatSymbols(symbols);
        return precision.format(amountValue);
    }

    public String getAmountWithCurrencyFormatted() {
        String currency = getCurrencySymbol();
        return currency.isEmpty() ? getAmountFormatted() : getAmountFormatted() + " " + currency;
    }

    public String getAmountWithCurrencyShortNameFormatted(Context context) {
        String currencyName = getCurrencyShortName(context);
        return currencyName.isEmpty() ? getAmountFormatted() : getAmountFormatted() + " " + currencyName;
    }

    public String getSignedAmountWithCurrencyFormatted() {
        String signStr = isIncoming() ? Marker.ANY_NON_NULL_MARKER : "−";
        return signStr + " " + getAmountWithCurrencyFormatted();
    }

    public String getCurrencyShortName(Context context) {
        switch (this.currencyId) {
            case KAZAKHSTAN_TENGE_CURRENCY_ID /* 398 */:
                return context.getString(R.string.money_transfer_tenge_short_name);
            case RUSSIAN_ROUBLE_CURRENCY_ID /* 643 */:
                return context.getString(R.string.money_transfer_rouble_short_name);
            default:
                return "";
        }
    }

    public int getStatusStringId() {
        switch (this.status) {
            case 0:
                return R.string.money_transfer_status_pending;
            case 1:
                return R.string.money_transfer_status_completed;
            case 2:
                return R.string.money_transfer_status_cancelled;
            default:
                return 0;
        }
    }

    public String getCurrencySymbol() {
        if (this.currencyId == RUSSIAN_ROUBLE_CURRENCY_ID) {
            return SIGN_RUSSIAN_ROUBLE;
        }
        if (this.currencyId == KAZAKHSTAN_TENGE_CURRENCY_ID) {
            return SIGN_KAZAKHSTAN_TENGE;
        }
        return this.currencyName == null ? "" : this.currencyName;
    }

    public static String getYourCurrencySymbol() {
        return getYourCurrencySymbol(VKAccountManager.getCurrent().monetTransfersCurrency);
    }

    public static String getYourCurrencySymbol(String currency) {
        String val = currency == null ? "" : currency;
        char c = 65535;
        switch (val.hashCode()) {
            case 74949:
                if (val.equals(CURRENCY_KAZAKHSTAN_TENGE)) {
                    c = 1;
                    break;
                }
                break;
            case 81503:
                if (val.equals(CURRENCY_RUSSIAN_ROUBLE)) {
                    c = 0;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
                return SIGN_RUSSIAN_ROUBLE;
            case 1:
                return SIGN_KAZAKHSTAN_TENGE;
            default:
                return "";
        }
    }
}
