.class public interface abstract Lcom/vkontakte/android/data/PurchasesManager$Product;
.super Ljava/lang/Object;
.source "PurchasesManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/data/PurchasesManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Product"
.end annotation


# virtual methods
.method public abstract afterPurchased(Lcom/vkontakte/android/data/PurchasesManager$Result;)V
.end method

.method public abstract getDeveloperPayload()Ljava/lang/String;
.end method

.method public abstract getId()I
.end method

.method public abstract getMerchantProductId()Ljava/lang/String;
.end method

.method public abstract getPaymentType()Lcom/vkontakte/android/api/models/PaymentType;
.end method

.method public abstract getPrice()I
.end method

.method public abstract getRefer()Ljava/lang/String;
.end method

.method public abstract getType()Ljava/lang/String;
.end method

.method public abstract isFree()Z
.end method
