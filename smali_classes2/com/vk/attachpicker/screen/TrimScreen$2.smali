.class Lcom/vk/attachpicker/screen/TrimScreen$2;
.super Ljava/lang/Object;
.source "TrimScreen.java"

# interfaces
.implements Lcom/vk/imageloader/OnLoadCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/screen/TrimScreen;->createView(Landroid/view/LayoutInflater;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/attachpicker/screen/TrimScreen;


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/screen/TrimScreen;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/attachpicker/screen/TrimScreen;

    .prologue
    .line 217
    iput-object p1, p0, Lcom/vk/attachpicker/screen/TrimScreen$2;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure()V
    .locals 0

    .prologue
    .line 225
    return-void
.end method

.method public onSuccess(II)V
    .locals 2
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 220
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen$2;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vk/attachpicker/screen/TrimScreen;->access$902(Lcom/vk/attachpicker/screen/TrimScreen;Z)Z

    .line 221
    return-void
.end method
