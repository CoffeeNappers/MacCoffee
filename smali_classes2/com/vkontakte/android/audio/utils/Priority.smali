.class public final enum Lcom/vkontakte/android/audio/utils/Priority;
.super Ljava/lang/Enum;
.source "Priority.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vkontakte/android/audio/utils/Priority;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vkontakte/android/audio/utils/Priority;

.field public static final enum HIGH:Lcom/vkontakte/android/audio/utils/Priority;

.field public static final enum HIGHEST:Lcom/vkontakte/android/audio/utils/Priority;

.field public static final enum LOW:Lcom/vkontakte/android/audio/utils/Priority;

.field public static final enum LOWEST:Lcom/vkontakte/android/audio/utils/Priority;

.field public static final enum MEDIUM:Lcom/vkontakte/android/audio/utils/Priority;

.field public static final VALUES:[Lcom/vkontakte/android/audio/utils/Priority;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 4
    new-instance v0, Lcom/vkontakte/android/audio/utils/Priority;

    const-string/jumbo v1, "HIGHEST"

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/audio/utils/Priority;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/audio/utils/Priority;->HIGHEST:Lcom/vkontakte/android/audio/utils/Priority;

    new-instance v0, Lcom/vkontakte/android/audio/utils/Priority;

    const-string/jumbo v1, "HIGH"

    invoke-direct {v0, v1, v3}, Lcom/vkontakte/android/audio/utils/Priority;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/audio/utils/Priority;->HIGH:Lcom/vkontakte/android/audio/utils/Priority;

    new-instance v0, Lcom/vkontakte/android/audio/utils/Priority;

    const-string/jumbo v1, "MEDIUM"

    invoke-direct {v0, v1, v4}, Lcom/vkontakte/android/audio/utils/Priority;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/audio/utils/Priority;->MEDIUM:Lcom/vkontakte/android/audio/utils/Priority;

    new-instance v0, Lcom/vkontakte/android/audio/utils/Priority;

    const-string/jumbo v1, "LOW"

    invoke-direct {v0, v1, v5}, Lcom/vkontakte/android/audio/utils/Priority;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/audio/utils/Priority;->LOW:Lcom/vkontakte/android/audio/utils/Priority;

    new-instance v0, Lcom/vkontakte/android/audio/utils/Priority;

    const-string/jumbo v1, "LOWEST"

    invoke-direct {v0, v1, v6}, Lcom/vkontakte/android/audio/utils/Priority;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/audio/utils/Priority;->LOWEST:Lcom/vkontakte/android/audio/utils/Priority;

    .line 3
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/vkontakte/android/audio/utils/Priority;

    sget-object v1, Lcom/vkontakte/android/audio/utils/Priority;->HIGHEST:Lcom/vkontakte/android/audio/utils/Priority;

    aput-object v1, v0, v2

    sget-object v1, Lcom/vkontakte/android/audio/utils/Priority;->HIGH:Lcom/vkontakte/android/audio/utils/Priority;

    aput-object v1, v0, v3

    sget-object v1, Lcom/vkontakte/android/audio/utils/Priority;->MEDIUM:Lcom/vkontakte/android/audio/utils/Priority;

    aput-object v1, v0, v4

    sget-object v1, Lcom/vkontakte/android/audio/utils/Priority;->LOW:Lcom/vkontakte/android/audio/utils/Priority;

    aput-object v1, v0, v5

    sget-object v1, Lcom/vkontakte/android/audio/utils/Priority;->LOWEST:Lcom/vkontakte/android/audio/utils/Priority;

    aput-object v1, v0, v6

    sput-object v0, Lcom/vkontakte/android/audio/utils/Priority;->$VALUES:[Lcom/vkontakte/android/audio/utils/Priority;

    .line 6
    invoke-static {}, Lcom/vkontakte/android/audio/utils/Priority;->values()[Lcom/vkontakte/android/audio/utils/Priority;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/utils/Priority;->VALUES:[Lcom/vkontakte/android/audio/utils/Priority;

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
    .line 3
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vkontakte/android/audio/utils/Priority;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 3
    const-class v0, Lcom/vkontakte/android/audio/utils/Priority;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/utils/Priority;

    return-object v0
.end method

.method public static values()[Lcom/vkontakte/android/audio/utils/Priority;
    .locals 1

    .prologue
    .line 3
    sget-object v0, Lcom/vkontakte/android/audio/utils/Priority;->$VALUES:[Lcom/vkontakte/android/audio/utils/Priority;

    invoke-virtual {v0}, [Lcom/vkontakte/android/audio/utils/Priority;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vkontakte/android/audio/utils/Priority;

    return-object v0
.end method
