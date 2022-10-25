.class public final enum Lcom/vk/camera/CameraMode;
.super Ljava/lang/Enum;
.source "CameraMode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vk/camera/CameraMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vk/camera/CameraMode;

.field public static final enum BACK:Lcom/vk/camera/CameraMode;

.field public static final enum FRONT:Lcom/vk/camera/CameraMode;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 4
    new-instance v0, Lcom/vk/camera/CameraMode;

    const-string/jumbo v1, "FRONT"

    invoke-direct {v0, v1, v2}, Lcom/vk/camera/CameraMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/camera/CameraMode;->FRONT:Lcom/vk/camera/CameraMode;

    new-instance v0, Lcom/vk/camera/CameraMode;

    const-string/jumbo v1, "BACK"

    invoke-direct {v0, v1, v3}, Lcom/vk/camera/CameraMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/camera/CameraMode;->BACK:Lcom/vk/camera/CameraMode;

    .line 3
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/vk/camera/CameraMode;

    sget-object v1, Lcom/vk/camera/CameraMode;->FRONT:Lcom/vk/camera/CameraMode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/vk/camera/CameraMode;->BACK:Lcom/vk/camera/CameraMode;

    aput-object v1, v0, v3

    sput-object v0, Lcom/vk/camera/CameraMode;->$VALUES:[Lcom/vk/camera/CameraMode;

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

.method public static valueOf(Ljava/lang/String;)Lcom/vk/camera/CameraMode;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 3
    const-class v0, Lcom/vk/camera/CameraMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vk/camera/CameraMode;

    return-object v0
.end method

.method public static values()[Lcom/vk/camera/CameraMode;
    .locals 1

    .prologue
    .line 3
    sget-object v0, Lcom/vk/camera/CameraMode;->$VALUES:[Lcom/vk/camera/CameraMode;

    invoke-virtual {v0}, [Lcom/vk/camera/CameraMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vk/camera/CameraMode;

    return-object v0
.end method
