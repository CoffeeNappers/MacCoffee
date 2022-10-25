.class public Lcom/vkontakte/android/data/PurchasesManager$PayNotAvailableException;
.super Ljava/lang/Exception;
.source "PurchasesManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/data/PurchasesManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PayNotAvailableException"
.end annotation


# instance fields
.field private mErrorCode:Ljava/lang/Integer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 535
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 536
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "errorCode"    # I

    .prologue
    .line 531
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 532
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager$PayNotAvailableException;->mErrorCode:Ljava/lang/Integer;

    .line 533
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 528
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    .line 529
    return-void
.end method


# virtual methods
.method public getCode()I
    .locals 1

    .prologue
    .line 539
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager$PayNotAvailableException;->mErrorCode:Ljava/lang/Integer;

    if-nez v0, :cond_0

    const/4 v0, -0x1

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager$PayNotAvailableException;->mErrorCode:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_0
.end method

.method public hasCode()Z
    .locals 1

    .prologue
    .line 543
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager$PayNotAvailableException;->mErrorCode:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
