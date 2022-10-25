.class public final enum Lcom/vk/music/utils/BoomHelper$Action;
.super Ljava/lang/Enum;
.source "BoomHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/utils/BoomHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Action"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vk/music/utils/BoomHelper$Action;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vk/music/utils/BoomHelper$Action;

.field public static final enum download:Lcom/vk/music/utils/BoomHelper$Action;

.field public static final enum play:Lcom/vk/music/utils/BoomHelper$Action;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 27
    new-instance v0, Lcom/vk/music/utils/BoomHelper$Action;

    const-string/jumbo v1, "play"

    invoke-direct {v0, v1, v2}, Lcom/vk/music/utils/BoomHelper$Action;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/music/utils/BoomHelper$Action;->play:Lcom/vk/music/utils/BoomHelper$Action;

    new-instance v0, Lcom/vk/music/utils/BoomHelper$Action;

    const-string/jumbo v1, "download"

    invoke-direct {v0, v1, v3}, Lcom/vk/music/utils/BoomHelper$Action;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/music/utils/BoomHelper$Action;->download:Lcom/vk/music/utils/BoomHelper$Action;

    .line 26
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/vk/music/utils/BoomHelper$Action;

    sget-object v1, Lcom/vk/music/utils/BoomHelper$Action;->play:Lcom/vk/music/utils/BoomHelper$Action;

    aput-object v1, v0, v2

    sget-object v1, Lcom/vk/music/utils/BoomHelper$Action;->download:Lcom/vk/music/utils/BoomHelper$Action;

    aput-object v1, v0, v3

    sput-object v0, Lcom/vk/music/utils/BoomHelper$Action;->$VALUES:[Lcom/vk/music/utils/BoomHelper$Action;

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
    .line 26
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vk/music/utils/BoomHelper$Action;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 26
    const-class v0, Lcom/vk/music/utils/BoomHelper$Action;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vk/music/utils/BoomHelper$Action;

    return-object v0
.end method

.method public static values()[Lcom/vk/music/utils/BoomHelper$Action;
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lcom/vk/music/utils/BoomHelper$Action;->$VALUES:[Lcom/vk/music/utils/BoomHelper$Action;

    invoke-virtual {v0}, [Lcom/vk/music/utils/BoomHelper$Action;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vk/music/utils/BoomHelper$Action;

    return-object v0
.end method
