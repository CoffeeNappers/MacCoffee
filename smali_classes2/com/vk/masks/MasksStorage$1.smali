.class Lcom/vk/masks/MasksStorage$1;
.super Ljava/lang/Object;
.source "MasksStorage.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/masks/MasksStorage;->deleteMaskInternal(Lcom/vk/masks/model/Mask;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/masks/MasksStorage;

.field final synthetic val$mask:Lcom/vk/masks/model/Mask;


# direct methods
.method constructor <init>(Lcom/vk/masks/MasksStorage;Lcom/vk/masks/model/Mask;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/masks/MasksStorage;

    .prologue
    .line 179
    iput-object p1, p0, Lcom/vk/masks/MasksStorage$1;->this$0:Lcom/vk/masks/MasksStorage;

    iput-object p2, p0, Lcom/vk/masks/MasksStorage$1;->val$mask:Lcom/vk/masks/model/Mask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 182
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vk/masks/MasksStorage$1;->val$mask:Lcom/vk/masks/model/Mask;

    invoke-virtual {v2}, Lcom/vk/masks/model/Mask;->getFullId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vk/media/camera/CameraUtilsEffects;->effectDir(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 183
    .local v0, "file":Ljava/io/File;
    invoke-static {v0}, Lcom/vk/core/util/FileUtils;->doubleTryDeleteFile(Ljava/io/File;)V

    .line 184
    return-void
.end method
