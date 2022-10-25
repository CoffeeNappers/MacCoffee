.class final Lcom/vk/attachpicker/util/CameraUtils$1;
.super Landroid/os/AsyncTask;
.source "CameraUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/util/CameraUtils;->savePhotoAsync(Ljava/io/File;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$file:Ljava/io/File;


# direct methods
.method constructor <init>(Ljava/io/File;)V
    .locals 0

    .prologue
    .line 69
    iput-object p1, p0, Lcom/vk/attachpicker/util/CameraUtils$1;->val$file:Ljava/io/File;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 69
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/vk/attachpicker/util/CameraUtils$1;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 1
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 72
    iget-object v0, p0, Lcom/vk/attachpicker/util/CameraUtils$1;->val$file:Ljava/io/File;

    invoke-static {v0}, Lcom/vk/attachpicker/util/CameraUtils;->savePhoto(Ljava/io/File;)Ljava/io/File;

    .line 73
    const/4 v0, 0x0

    return-object v0
.end method
