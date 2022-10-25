.class Lcom/vkontakte/android/fragments/NewsfeedFilterListFragment$1;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "NewsfeedFilterListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/NewsfeedFilterListFragment;->onActionClick(Lcom/vkontakte/android/UserProfile;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/NewsfeedFilterListFragment;

.field final synthetic val$userProfile:Lcom/vkontakte/android/UserProfile;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/NewsfeedFilterListFragment;Landroid/app/Fragment;Lcom/vkontakte/android/UserProfile;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/NewsfeedFilterListFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 18
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsfeedFilterListFragment$1;->this$0:Lcom/vkontakte/android/fragments/NewsfeedFilterListFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/NewsfeedFilterListFragment$1;->val$userProfile:Lcom/vkontakte/android/UserProfile;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 2

    .prologue
    .line 21
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsfeedFilterListFragment$1;->this$0:Lcom/vkontakte/android/fragments/NewsfeedFilterListFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsfeedFilterListFragment$1;->val$userProfile:Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/NewsfeedFilterListFragment;->onActionSuccess(Lcom/vkontakte/android/UserProfile;)V

    .line 22
    return-void
.end method
