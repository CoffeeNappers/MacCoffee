.class public final enum Lcom/vkontakte/android/data/CatalogInfo$FilterType;
.super Ljava/lang/Enum;
.source "CatalogInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/data/CatalogInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "FilterType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vkontakte/android/data/CatalogInfo$FilterType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vkontakte/android/data/CatalogInfo$FilterType;

.field public static final enum featured:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

.field public static final enum filterNew:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

.field public static final enum html5:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

.field public static final enum installed:Lcom/vkontakte/android/data/CatalogInfo$FilterType;


# instance fields
.field final serverKey:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 10
    new-instance v0, Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    const-string/jumbo v1, "installed"

    const-string/jumbo v2, "installed"

    invoke-direct {v0, v1, v3, v2}, Lcom/vkontakte/android/data/CatalogInfo$FilterType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/data/CatalogInfo$FilterType;->installed:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    new-instance v0, Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    const-string/jumbo v1, "featured"

    const-string/jumbo v2, "featured"

    invoke-direct {v0, v1, v4, v2}, Lcom/vkontakte/android/data/CatalogInfo$FilterType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/data/CatalogInfo$FilterType;->featured:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    new-instance v0, Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    const-string/jumbo v1, "filterNew"

    const-string/jumbo v2, "new"

    invoke-direct {v0, v1, v5, v2}, Lcom/vkontakte/android/data/CatalogInfo$FilterType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/data/CatalogInfo$FilterType;->filterNew:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    new-instance v0, Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    const-string/jumbo v1, "html5"

    const-string/jumbo v2, "html5"

    invoke-direct {v0, v1, v6, v2}, Lcom/vkontakte/android/data/CatalogInfo$FilterType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/data/CatalogInfo$FilterType;->html5:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    .line 9
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    sget-object v1, Lcom/vkontakte/android/data/CatalogInfo$FilterType;->installed:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/vkontakte/android/data/CatalogInfo$FilterType;->featured:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/vkontakte/android/data/CatalogInfo$FilterType;->filterNew:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/vkontakte/android/data/CatalogInfo$FilterType;->html5:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    aput-object v1, v0, v6

    sput-object v0, Lcom/vkontakte/android/data/CatalogInfo$FilterType;->$VALUES:[Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "serverKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 14
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 15
    iput-object p3, p0, Lcom/vkontakte/android/data/CatalogInfo$FilterType;->serverKey:Ljava/lang/String;

    .line 16
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/data/CatalogInfo$FilterType;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    .prologue
    .line 9
    invoke-direct {p0}, Lcom/vkontakte/android/data/CatalogInfo$FilterType;->getServerKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getServerKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 19
    iget-object v0, p0, Lcom/vkontakte/android/data/CatalogInfo$FilterType;->serverKey:Ljava/lang/String;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vkontakte/android/data/CatalogInfo$FilterType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 9
    const-class v0, Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    return-object v0
.end method

.method public static values()[Lcom/vkontakte/android/data/CatalogInfo$FilterType;
    .locals 1

    .prologue
    .line 9
    sget-object v0, Lcom/vkontakte/android/data/CatalogInfo$FilterType;->$VALUES:[Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    invoke-virtual {v0}, [Lcom/vkontakte/android/data/CatalogInfo$FilterType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    return-object v0
.end method
