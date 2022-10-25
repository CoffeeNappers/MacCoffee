.class abstract Lcom/vk/sharing/CommonPresenter$InternalDelegate;
.super Ljava/lang/Object;
.source "CommonPresenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/sharing/CommonPresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "InternalDelegate"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/sharing/CommonPresenter;


# direct methods
.method private constructor <init>(Lcom/vk/sharing/CommonPresenter;)V
    .locals 0

    .prologue
    .line 206
    iput-object p1, p0, Lcom/vk/sharing/CommonPresenter$InternalDelegate;->this$0:Lcom/vk/sharing/CommonPresenter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/sharing/CommonPresenter;Lcom/vk/sharing/CommonPresenter$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/sharing/CommonPresenter;
    .param p2, "x1"    # Lcom/vk/sharing/CommonPresenter$1;

    .prologue
    .line 206
    invoke-direct {p0, p1}, Lcom/vk/sharing/CommonPresenter$InternalDelegate;-><init>(Lcom/vk/sharing/CommonPresenter;)V

    return-void
.end method


# virtual methods
.method abstract onListItemClick(Lcom/vk/sharing/target/Target;I)V
    .param p1    # Lcom/vk/sharing/target/Target;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method final toggleTarget(Lcom/vk/sharing/target/Target;I)V
    .locals 1
    .param p1, "target"    # Lcom/vk/sharing/target/Target;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "position"    # I

    .prologue
    .line 211
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter$InternalDelegate;->this$0:Lcom/vk/sharing/CommonPresenter;

    iget-object v0, v0, Lcom/vk/sharing/CommonPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0, p1}, Lcom/vk/sharing/target/Targets;->toggleSelection(Lcom/vk/sharing/target/Target;)Z

    .line 212
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter$InternalDelegate;->this$0:Lcom/vk/sharing/CommonPresenter;

    iget-object v0, v0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0, p2}, Lcom/vk/sharing/view/SharingView;->updateTargetAtPosition(I)V

    .line 213
    return-void
.end method
