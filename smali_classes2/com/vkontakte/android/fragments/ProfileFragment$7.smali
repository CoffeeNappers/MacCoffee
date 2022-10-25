.class Lcom/vkontakte/android/fragments/ProfileFragment$7;
.super Ljava/lang/Object;
.source "ProfileFragment.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;->applyLayout()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 692
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$7;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 695
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$7;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$2000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$7;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$2100(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/ViewGroup;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 696
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$7;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$2200(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v0

    invoke-virtual {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 697
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$7;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$2300(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/ViewGroup;

    move-result-object v2

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$7;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$1600(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v0

    if-nez v0, :cond_1

    move v0, v1

    :goto_0
    invoke-virtual {v2, v1, v0, v1, v1}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 699
    :cond_0
    return v1

    .line 697
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$7;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getHeight()I

    move-result v0

    goto :goto_0
.end method
