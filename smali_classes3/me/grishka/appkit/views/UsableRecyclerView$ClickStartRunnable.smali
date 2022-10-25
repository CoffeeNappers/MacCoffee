.class Lme/grishka/appkit/views/UsableRecyclerView$ClickStartRunnable;
.super Ljava/lang/Object;
.source "UsableRecyclerView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lme/grishka/appkit/views/UsableRecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ClickStartRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lme/grishka/appkit/views/UsableRecyclerView;


# direct methods
.method private constructor <init>(Lme/grishka/appkit/views/UsableRecyclerView;)V
    .locals 0

    .prologue
    .line 472
    iput-object p1, p0, Lme/grishka/appkit/views/UsableRecyclerView$ClickStartRunnable;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lme/grishka/appkit/views/UsableRecyclerView;Lme/grishka/appkit/views/UsableRecyclerView$1;)V
    .locals 0
    .param p1, "x0"    # Lme/grishka/appkit/views/UsableRecyclerView;
    .param p2, "x1"    # Lme/grishka/appkit/views/UsableRecyclerView$1;

    .prologue
    .line 472
    invoke-direct {p0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$ClickStartRunnable;-><init>(Lme/grishka/appkit/views/UsableRecyclerView;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 475
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$ClickStartRunnable;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->access$900(Lme/grishka/appkit/views/UsableRecyclerView;)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v0

    if-nez v0, :cond_0

    .line 479
    :goto_0
    return-void

    .line 476
    :cond_0
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$ClickStartRunnable;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->access$1002(Lme/grishka/appkit/views/UsableRecyclerView;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    .line 477
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$ClickStartRunnable;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->access$500(Lme/grishka/appkit/views/UsableRecyclerView;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setPressed(Z)V

    .line 478
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$ClickStartRunnable;->this$0:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->access$700(Lme/grishka/appkit/views/UsableRecyclerView;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {}, Lme/grishka/appkit/views/UsableRecyclerView;->access$1100()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    goto :goto_0
.end method
