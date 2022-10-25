.class Lcom/vk/attachpicker/adapter/PhotoSmallAdapter$CameraHeaderHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "PhotoSmallAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CameraHeaderHolder"
.end annotation


# instance fields
.field private final cameraLock:Lcom/vk/core/util/TimeoutLock;

.field private cameraView:Landroid/view/View;

.field private emptyView:Landroid/view/View;

.field final synthetic this$0:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;


# direct methods
.method public constructor <init>(Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;Landroid/content/Context;)V
    .locals 4
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 144
    iput-object p1, p0, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter$CameraHeaderHolder;->this$0:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    .line 145
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f03019a

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 139
    new-instance v0, Lcom/vk/core/util/TimeoutLock;

    const-wide/16 v2, 0x1f4

    invoke-direct {v0, v2, v3}, Lcom/vk/core/util/TimeoutLock;-><init>(J)V

    iput-object v0, p0, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter$CameraHeaderHolder;->cameraLock:Lcom/vk/core/util/TimeoutLock;

    .line 147
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter$CameraHeaderHolder;->itemView:Landroid/view/View;

    const v1, 0x7f10046a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter$CameraHeaderHolder;->cameraView:Landroid/view/View;

    .line 148
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter$CameraHeaderHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100343

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter$CameraHeaderHolder;->emptyView:Landroid/view/View;

    .line 150
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter$CameraHeaderHolder;->cameraView:Landroid/view/View;

    const v1, 0x7f10046b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {p0}, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter$CameraHeaderHolder$$Lambda$1;->lambdaFactory$(Lcom/vk/attachpicker/adapter/PhotoSmallAdapter$CameraHeaderHolder;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 160
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter$CameraHeaderHolder;->cameraView:Landroid/view/View;

    const v1, 0x7f10046c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {p0}, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter$CameraHeaderHolder$$Lambda$2;->lambdaFactory$(Lcom/vk/attachpicker/adapter/PhotoSmallAdapter$CameraHeaderHolder;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 170
    return-void
.end method


# virtual methods
.method synthetic lambda$new$0(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 151
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter$CameraHeaderHolder;->cameraLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->isLocked()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 159
    :cond_0
    :goto_0
    return-void

    .line 154
    :cond_1
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter$CameraHeaderHolder;->cameraLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->lock()V

    .line 156
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter$CameraHeaderHolder;->this$0:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    invoke-static {v0}, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;->access$100(Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;)Landroid/view/View$OnClickListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 157
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter$CameraHeaderHolder;->this$0:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    invoke-static {v0}, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;->access$100(Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;)Landroid/view/View$OnClickListener;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    goto :goto_0
.end method

.method synthetic lambda$new$1(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter$CameraHeaderHolder;->cameraLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->isLocked()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 169
    :cond_0
    :goto_0
    return-void

    .line 164
    :cond_1
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter$CameraHeaderHolder;->cameraLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->lock()V

    .line 166
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter$CameraHeaderHolder;->this$0:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    invoke-static {v0}, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;->access$000(Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;)Landroid/view/View$OnClickListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 167
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter$CameraHeaderHolder;->this$0:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    invoke-static {v0}, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;->access$000(Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;)Landroid/view/View$OnClickListener;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    goto :goto_0
.end method

.method public update(ZZ)V
    .locals 3
    .param p1, "camera"    # Z
    .param p2, "empty"    # Z

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 173
    if-eqz p1, :cond_0

    .line 174
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter$CameraHeaderHolder;->cameraView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 179
    :goto_0
    if-eqz p2, :cond_1

    .line 180
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter$CameraHeaderHolder;->emptyView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 184
    :goto_1
    return-void

    .line 176
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter$CameraHeaderHolder;->cameraView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 182
    :cond_1
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter$CameraHeaderHolder;->emptyView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1
.end method
