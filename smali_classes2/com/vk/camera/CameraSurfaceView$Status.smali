.class public final enum Lcom/vk/camera/CameraSurfaceView$Status;
.super Ljava/lang/Enum;
.source "CameraSurfaceView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/camera/CameraSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Status"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vk/camera/CameraSurfaceView$Status;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vk/camera/CameraSurfaceView$Status;

.field public static final enum STATUS_EMPTY_CAMERA:Lcom/vk/camera/CameraSurfaceView$Status;

.field public static final enum STATUS_NOT_EXIST:Lcom/vk/camera/CameraSurfaceView$Status;

.field public static final enum STATUS_NOT_LOADED:Lcom/vk/camera/CameraSurfaceView$Status;

.field public static final enum STATUS_OK:Lcom/vk/camera/CameraSurfaceView$Status;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 29
    new-instance v0, Lcom/vk/camera/CameraSurfaceView$Status;

    const-string/jumbo v1, "STATUS_OK"

    invoke-direct {v0, v1, v2}, Lcom/vk/camera/CameraSurfaceView$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/camera/CameraSurfaceView$Status;->STATUS_OK:Lcom/vk/camera/CameraSurfaceView$Status;

    .line 30
    new-instance v0, Lcom/vk/camera/CameraSurfaceView$Status;

    const-string/jumbo v1, "STATUS_NOT_EXIST"

    invoke-direct {v0, v1, v3}, Lcom/vk/camera/CameraSurfaceView$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/camera/CameraSurfaceView$Status;->STATUS_NOT_EXIST:Lcom/vk/camera/CameraSurfaceView$Status;

    .line 31
    new-instance v0, Lcom/vk/camera/CameraSurfaceView$Status;

    const-string/jumbo v1, "STATUS_NOT_LOADED"

    invoke-direct {v0, v1, v4}, Lcom/vk/camera/CameraSurfaceView$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/camera/CameraSurfaceView$Status;->STATUS_NOT_LOADED:Lcom/vk/camera/CameraSurfaceView$Status;

    .line 32
    new-instance v0, Lcom/vk/camera/CameraSurfaceView$Status;

    const-string/jumbo v1, "STATUS_EMPTY_CAMERA"

    invoke-direct {v0, v1, v5}, Lcom/vk/camera/CameraSurfaceView$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/camera/CameraSurfaceView$Status;->STATUS_EMPTY_CAMERA:Lcom/vk/camera/CameraSurfaceView$Status;

    .line 28
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/vk/camera/CameraSurfaceView$Status;

    sget-object v1, Lcom/vk/camera/CameraSurfaceView$Status;->STATUS_OK:Lcom/vk/camera/CameraSurfaceView$Status;

    aput-object v1, v0, v2

    sget-object v1, Lcom/vk/camera/CameraSurfaceView$Status;->STATUS_NOT_EXIST:Lcom/vk/camera/CameraSurfaceView$Status;

    aput-object v1, v0, v3

    sget-object v1, Lcom/vk/camera/CameraSurfaceView$Status;->STATUS_NOT_LOADED:Lcom/vk/camera/CameraSurfaceView$Status;

    aput-object v1, v0, v4

    sget-object v1, Lcom/vk/camera/CameraSurfaceView$Status;->STATUS_EMPTY_CAMERA:Lcom/vk/camera/CameraSurfaceView$Status;

    aput-object v1, v0, v5

    sput-object v0, Lcom/vk/camera/CameraSurfaceView$Status;->$VALUES:[Lcom/vk/camera/CameraSurfaceView$Status;

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
    .line 28
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vk/camera/CameraSurfaceView$Status;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 28
    const-class v0, Lcom/vk/camera/CameraSurfaceView$Status;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vk/camera/CameraSurfaceView$Status;

    return-object v0
.end method

.method public static values()[Lcom/vk/camera/CameraSurfaceView$Status;
    .locals 1

    .prologue
    .line 28
    sget-object v0, Lcom/vk/camera/CameraSurfaceView$Status;->$VALUES:[Lcom/vk/camera/CameraSurfaceView$Status;

    invoke-virtual {v0}, [Lcom/vk/camera/CameraSurfaceView$Status;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vk/camera/CameraSurfaceView$Status;

    return-object v0
.end method
