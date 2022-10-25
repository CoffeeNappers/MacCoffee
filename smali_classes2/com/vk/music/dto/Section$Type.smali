.class public final enum Lcom/vk/music/dto/Section$Type;
.super Ljava/lang/Enum;
.source "Section.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/dto/Section;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vk/music/dto/Section$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vk/music/dto/Section$Type;

.field public static final enum audios:Lcom/vk/music/dto/Section$Type;

.field public static final enum audios_special:Lcom/vk/music/dto/Section$Type;

.field public static final enum extended_playlists:Lcom/vk/music/dto/Section$Type;

.field public static final enum groups:Lcom/vk/music/dto/Section$Type;

.field public static final enum owners:Lcom/vk/music/dto/Section$Type;

.field public static final enum playlists:Lcom/vk/music/dto/Section$Type;

.field public static final enum unknown:Lcom/vk/music/dto/Section$Type;

.field public static final enum users:Lcom/vk/music/dto/Section$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 21
    new-instance v0, Lcom/vk/music/dto/Section$Type;

    const-string/jumbo v1, "audios"

    invoke-direct {v0, v1, v3}, Lcom/vk/music/dto/Section$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/music/dto/Section$Type;->audios:Lcom/vk/music/dto/Section$Type;

    new-instance v0, Lcom/vk/music/dto/Section$Type;

    const-string/jumbo v1, "users"

    invoke-direct {v0, v1, v4}, Lcom/vk/music/dto/Section$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/music/dto/Section$Type;->users:Lcom/vk/music/dto/Section$Type;

    new-instance v0, Lcom/vk/music/dto/Section$Type;

    const-string/jumbo v1, "groups"

    invoke-direct {v0, v1, v5}, Lcom/vk/music/dto/Section$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/music/dto/Section$Type;->groups:Lcom/vk/music/dto/Section$Type;

    new-instance v0, Lcom/vk/music/dto/Section$Type;

    const-string/jumbo v1, "owners"

    invoke-direct {v0, v1, v6}, Lcom/vk/music/dto/Section$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/music/dto/Section$Type;->owners:Lcom/vk/music/dto/Section$Type;

    new-instance v0, Lcom/vk/music/dto/Section$Type;

    const-string/jumbo v1, "playlists"

    invoke-direct {v0, v1, v7}, Lcom/vk/music/dto/Section$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/music/dto/Section$Type;->playlists:Lcom/vk/music/dto/Section$Type;

    new-instance v0, Lcom/vk/music/dto/Section$Type;

    const-string/jumbo v1, "audios_special"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/vk/music/dto/Section$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/music/dto/Section$Type;->audios_special:Lcom/vk/music/dto/Section$Type;

    new-instance v0, Lcom/vk/music/dto/Section$Type;

    const-string/jumbo v1, "extended_playlists"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/vk/music/dto/Section$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/music/dto/Section$Type;->extended_playlists:Lcom/vk/music/dto/Section$Type;

    new-instance v0, Lcom/vk/music/dto/Section$Type;

    const-string/jumbo v1, "unknown"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/vk/music/dto/Section$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/music/dto/Section$Type;->unknown:Lcom/vk/music/dto/Section$Type;

    .line 20
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/vk/music/dto/Section$Type;

    sget-object v1, Lcom/vk/music/dto/Section$Type;->audios:Lcom/vk/music/dto/Section$Type;

    aput-object v1, v0, v3

    sget-object v1, Lcom/vk/music/dto/Section$Type;->users:Lcom/vk/music/dto/Section$Type;

    aput-object v1, v0, v4

    sget-object v1, Lcom/vk/music/dto/Section$Type;->groups:Lcom/vk/music/dto/Section$Type;

    aput-object v1, v0, v5

    sget-object v1, Lcom/vk/music/dto/Section$Type;->owners:Lcom/vk/music/dto/Section$Type;

    aput-object v1, v0, v6

    sget-object v1, Lcom/vk/music/dto/Section$Type;->playlists:Lcom/vk/music/dto/Section$Type;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/vk/music/dto/Section$Type;->audios_special:Lcom/vk/music/dto/Section$Type;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/vk/music/dto/Section$Type;->extended_playlists:Lcom/vk/music/dto/Section$Type;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/vk/music/dto/Section$Type;->unknown:Lcom/vk/music/dto/Section$Type;

    aput-object v2, v0, v1

    sput-object v0, Lcom/vk/music/dto/Section$Type;->$VALUES:[Lcom/vk/music/dto/Section$Type;

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
    .line 20
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)Lcom/vk/music/dto/Section$Type;
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 20
    invoke-static {p0}, Lcom/vk/music/dto/Section$Type;->parseType(Ljava/lang/String;)Lcom/vk/music/dto/Section$Type;

    move-result-object v0

    return-object v0
.end method

.method private static parseType(Ljava/lang/String;)Lcom/vk/music/dto/Section$Type;
    .locals 2
    .param p0, "s"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 26
    :try_start_0
    invoke-static {p0}, Lcom/vk/music/dto/Section$Type;->valueOf(Ljava/lang/String;)Lcom/vk/music/dto/Section$Type;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 28
    :goto_0
    return-object v1

    .line 27
    :catch_0
    move-exception v0

    .line 28
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/vk/music/dto/Section$Type;->unknown:Lcom/vk/music/dto/Section$Type;

    goto :goto_0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vk/music/dto/Section$Type;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 20
    const-class v0, Lcom/vk/music/dto/Section$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/Section$Type;

    return-object v0
.end method

.method public static values()[Lcom/vk/music/dto/Section$Type;
    .locals 1

    .prologue
    .line 20
    sget-object v0, Lcom/vk/music/dto/Section$Type;->$VALUES:[Lcom/vk/music/dto/Section$Type;

    invoke-virtual {v0}, [Lcom/vk/music/dto/Section$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vk/music/dto/Section$Type;

    return-object v0
.end method
