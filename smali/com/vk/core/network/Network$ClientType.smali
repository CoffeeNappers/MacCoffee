.class public final enum Lcom/vk/core/network/Network$ClientType;
.super Ljava/lang/Enum;
.source "Network.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/core/network/Network;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ClientType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vk/core/network/Network$ClientType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vk/core/network/Network$ClientType;

.field public static final enum CLIENT_DEFAULT:Lcom/vk/core/network/Network$ClientType;

.field public static final enum CLIENT_EMOJI:Lcom/vk/core/network/Network$ClientType;

.field public static final enum CLIENT_IMAGE_LOADER:Lcom/vk/core/network/Network$ClientType;

.field public static final enum CLIENT_LONGPOLL:Lcom/vk/core/network/Network$ClientType;

.field public static final enum CLIENT_PLAYER:Lcom/vk/core/network/Network$ClientType;

.field public static final enum CLIENT_VIGO:Lcom/vk/core/network/Network$ClientType;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 25
    new-instance v0, Lcom/vk/core/network/Network$ClientType;

    const-string/jumbo v1, "CLIENT_DEFAULT"

    invoke-direct {v0, v1, v3}, Lcom/vk/core/network/Network$ClientType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/core/network/Network$ClientType;->CLIENT_DEFAULT:Lcom/vk/core/network/Network$ClientType;

    .line 26
    new-instance v0, Lcom/vk/core/network/Network$ClientType;

    const-string/jumbo v1, "CLIENT_LONGPOLL"

    invoke-direct {v0, v1, v4}, Lcom/vk/core/network/Network$ClientType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/core/network/Network$ClientType;->CLIENT_LONGPOLL:Lcom/vk/core/network/Network$ClientType;

    .line 27
    new-instance v0, Lcom/vk/core/network/Network$ClientType;

    const-string/jumbo v1, "CLIENT_IMAGE_LOADER"

    invoke-direct {v0, v1, v5}, Lcom/vk/core/network/Network$ClientType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/core/network/Network$ClientType;->CLIENT_IMAGE_LOADER:Lcom/vk/core/network/Network$ClientType;

    .line 28
    new-instance v0, Lcom/vk/core/network/Network$ClientType;

    const-string/jumbo v1, "CLIENT_PLAYER"

    invoke-direct {v0, v1, v6}, Lcom/vk/core/network/Network$ClientType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/core/network/Network$ClientType;->CLIENT_PLAYER:Lcom/vk/core/network/Network$ClientType;

    .line 29
    new-instance v0, Lcom/vk/core/network/Network$ClientType;

    const-string/jumbo v1, "CLIENT_VIGO"

    invoke-direct {v0, v1, v7}, Lcom/vk/core/network/Network$ClientType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/core/network/Network$ClientType;->CLIENT_VIGO:Lcom/vk/core/network/Network$ClientType;

    .line 30
    new-instance v0, Lcom/vk/core/network/Network$ClientType;

    const-string/jumbo v1, "CLIENT_EMOJI"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/vk/core/network/Network$ClientType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/core/network/Network$ClientType;->CLIENT_EMOJI:Lcom/vk/core/network/Network$ClientType;

    .line 24
    const/4 v0, 0x6

    new-array v0, v0, [Lcom/vk/core/network/Network$ClientType;

    sget-object v1, Lcom/vk/core/network/Network$ClientType;->CLIENT_DEFAULT:Lcom/vk/core/network/Network$ClientType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/vk/core/network/Network$ClientType;->CLIENT_LONGPOLL:Lcom/vk/core/network/Network$ClientType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/vk/core/network/Network$ClientType;->CLIENT_IMAGE_LOADER:Lcom/vk/core/network/Network$ClientType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/vk/core/network/Network$ClientType;->CLIENT_PLAYER:Lcom/vk/core/network/Network$ClientType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/vk/core/network/Network$ClientType;->CLIENT_VIGO:Lcom/vk/core/network/Network$ClientType;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/vk/core/network/Network$ClientType;->CLIENT_EMOJI:Lcom/vk/core/network/Network$ClientType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/vk/core/network/Network$ClientType;->$VALUES:[Lcom/vk/core/network/Network$ClientType;

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
    .line 24
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vk/core/network/Network$ClientType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 24
    const-class v0, Lcom/vk/core/network/Network$ClientType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vk/core/network/Network$ClientType;

    return-object v0
.end method

.method public static values()[Lcom/vk/core/network/Network$ClientType;
    .locals 1

    .prologue
    .line 24
    sget-object v0, Lcom/vk/core/network/Network$ClientType;->$VALUES:[Lcom/vk/core/network/Network$ClientType;

    invoke-virtual {v0}, [Lcom/vk/core/network/Network$ClientType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vk/core/network/Network$ClientType;

    return-object v0
.end method
