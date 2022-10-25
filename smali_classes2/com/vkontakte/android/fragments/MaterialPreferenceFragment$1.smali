.class Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$1;
.super Ljava/lang/Object;
.source "MaterialPreferenceFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->onBindPreferences()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;

    .prologue
    .line 90
    iput-object p1, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$1;->this$0:Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 93
    iget-object v0, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$1;->this$0:Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->access$200(Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$1;->this$0:Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->access$000(Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v1

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$1;->this$0:Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->access$100(Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;)I

    move-result v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->smoothScrollToPosition(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;I)V

    .line 94
    return-void
.end method
