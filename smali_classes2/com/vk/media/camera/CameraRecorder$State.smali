.class public final enum Lcom/vk/media/camera/CameraRecorder$State;
.super Ljava/lang/Enum;
.source "CameraRecorder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/media/camera/CameraRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vk/media/camera/CameraRecorder$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vk/media/camera/CameraRecorder$State;

.field public static final enum IDLE:Lcom/vk/media/camera/CameraRecorder$State;

.field public static final enum PREPARED:Lcom/vk/media/camera/CameraRecorder$State;

.field public static final enum PREPARING:Lcom/vk/media/camera/CameraRecorder$State;

.field public static final enum RECORDING:Lcom/vk/media/camera/CameraRecorder$State;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 24
    new-instance v0, Lcom/vk/media/camera/CameraRecorder$State;

    const-string/jumbo v1, "IDLE"

    invoke-direct {v0, v1, v2}, Lcom/vk/media/camera/CameraRecorder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/media/camera/CameraRecorder$State;->IDLE:Lcom/vk/media/camera/CameraRecorder$State;

    .line 25
    new-instance v0, Lcom/vk/media/camera/CameraRecorder$State;

    const-string/jumbo v1, "PREPARING"

    invoke-direct {v0, v1, v3}, Lcom/vk/media/camera/CameraRecorder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/media/camera/CameraRecorder$State;->PREPARING:Lcom/vk/media/camera/CameraRecorder$State;

    .line 26
    new-instance v0, Lcom/vk/media/camera/CameraRecorder$State;

    const-string/jumbo v1, "PREPARED"

    invoke-direct {v0, v1, v4}, Lcom/vk/media/camera/CameraRecorder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/media/camera/CameraRecorder$State;->PREPARED:Lcom/vk/media/camera/CameraRecorder$State;

    .line 27
    new-instance v0, Lcom/vk/media/camera/CameraRecorder$State;

    const-string/jumbo v1, "RECORDING"

    invoke-direct {v0, v1, v5}, Lcom/vk/media/camera/CameraRecorder$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/media/camera/CameraRecorder$State;->RECORDING:Lcom/vk/media/camera/CameraRecorder$State;

    .line 23
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/vk/media/camera/CameraRecorder$State;

    sget-object v1, Lcom/vk/media/camera/CameraRecorder$State;->IDLE:Lcom/vk/media/camera/CameraRecorder$State;

    aput-object v1, v0, v2

    sget-object v1, Lcom/vk/media/camera/CameraRecorder$State;->PREPARING:Lcom/vk/media/camera/CameraRecorder$State;

    aput-object v1, v0, v3

    sget-object v1, Lcom/vk/media/camera/CameraRecorder$State;->PREPARED:Lcom/vk/media/camera/CameraRecorder$State;

    aput-object v1, v0, v4

    sget-object v1, Lcom/vk/media/camera/CameraRecorder$State;->RECORDING:Lcom/vk/media/camera/CameraRecorder$State;

    aput-object v1, v0, v5

    sput-object v0, Lcom/vk/media/camera/CameraRecorder$State;->$VALUES:[Lcom/vk/media/camera/CameraRecorder$State;

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
    .line 23
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vk/media/camera/CameraRecorder$State;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 23
    const-class v0, Lcom/vk/media/camera/CameraRecorder$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vk/media/camera/CameraRecorder$State;

    return-object v0
.end method

.method public static values()[Lcom/vk/media/camera/CameraRecorder$State;
    .locals 1

    .prologue
    .line 23
    sget-object v0, Lcom/vk/media/camera/CameraRecorder$State;->$VALUES:[Lcom/vk/media/camera/CameraRecorder$State;

    invoke-virtual {v0}, [Lcom/vk/media/camera/CameraRecorder$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vk/media/camera/CameraRecorder$State;

    return-object v0
.end method
