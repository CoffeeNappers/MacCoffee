.class Lcom/vkontakte/android/fragments/LeaderboardFragment$1;
.super Landroid/support/design/widget/BottomSheetBehavior$BottomSheetCallback;
.source "LeaderboardFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/LeaderboardFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/LeaderboardFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/LeaderboardFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/LeaderboardFragment;

    .prologue
    .line 59
    iput-object p1, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$1;->this$0:Lcom/vkontakte/android/fragments/LeaderboardFragment;

    invoke-direct {p0}, Landroid/support/design/widget/BottomSheetBehavior$BottomSheetCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onSlide(Landroid/view/View;F)V
    .locals 0
    .param p1, "bottomSheet"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "slideOffset"    # F

    .prologue
    .line 71
    return-void
.end method

.method public onStateChanged(Landroid/view/View;I)V
    .locals 1
    .param p1, "bottomSheet"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "newState"    # I

    .prologue
    .line 63
    const/4 v0, 0x5

    if-ne p2, v0, :cond_0

    .line 64
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$1;->this$0:Lcom/vkontakte/android/fragments/LeaderboardFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/LeaderboardFragment;->access$000(Lcom/vkontakte/android/fragments/LeaderboardFragment;)V

    .line 65
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$1;->this$0:Lcom/vkontakte/android/fragments/LeaderboardFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/LeaderboardFragment;->dismiss()V

    .line 67
    :cond_0
    return-void
.end method
