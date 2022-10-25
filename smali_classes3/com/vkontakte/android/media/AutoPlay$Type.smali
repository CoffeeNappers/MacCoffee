.class public final enum Lcom/vkontakte/android/media/AutoPlay$Type;
.super Ljava/lang/Enum;
.source "AutoPlay.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/media/AutoPlay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vkontakte/android/media/AutoPlay$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vkontakte/android/media/AutoPlay$Type;

.field public static final enum GIF:Lcom/vkontakte/android/media/AutoPlay$Type;

.field public static final enum VIDEO:Lcom/vkontakte/android/media/AutoPlay$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 34
    new-instance v0, Lcom/vkontakte/android/media/AutoPlay$Type;

    const-string/jumbo v1, "VIDEO"

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/media/AutoPlay$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/media/AutoPlay$Type;->VIDEO:Lcom/vkontakte/android/media/AutoPlay$Type;

    new-instance v0, Lcom/vkontakte/android/media/AutoPlay$Type;

    const-string/jumbo v1, "GIF"

    invoke-direct {v0, v1, v3}, Lcom/vkontakte/android/media/AutoPlay$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/media/AutoPlay$Type;->GIF:Lcom/vkontakte/android/media/AutoPlay$Type;

    .line 33
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/vkontakte/android/media/AutoPlay$Type;

    sget-object v1, Lcom/vkontakte/android/media/AutoPlay$Type;->VIDEO:Lcom/vkontakte/android/media/AutoPlay$Type;

    aput-object v1, v0, v2

    sget-object v1, Lcom/vkontakte/android/media/AutoPlay$Type;->GIF:Lcom/vkontakte/android/media/AutoPlay$Type;

    aput-object v1, v0, v3

    sput-object v0, Lcom/vkontakte/android/media/AutoPlay$Type;->$VALUES:[Lcom/vkontakte/android/media/AutoPlay$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vkontakte/android/media/AutoPlay$Type;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 33
    const-class v0, Lcom/vkontakte/android/media/AutoPlay$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/media/AutoPlay$Type;

    return-object v0
.end method

.method public static values()[Lcom/vkontakte/android/media/AutoPlay$Type;
    .locals 1

    .prologue
    .line 33
    sget-object v0, Lcom/vkontakte/android/media/AutoPlay$Type;->$VALUES:[Lcom/vkontakte/android/media/AutoPlay$Type;

    invoke-virtual {v0}, [Lcom/vkontakte/android/media/AutoPlay$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vkontakte/android/media/AutoPlay$Type;

    return-object v0
.end method
