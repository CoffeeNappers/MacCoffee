.class final Lcom/vkontakte/android/fragments/HtmlGameRequestFragment$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "HtmlGameRequestFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->showForResult(IILjava/lang/String;Ljava/lang/String;Landroid/app/Fragment;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/apps/AppGetWithUser$AppGetWithUserResponse;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$message:Ljava/lang/String;

.field final synthetic val$requestKey:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/app/Fragment;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 56
    iput-object p2, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment$1;->val$message:Ljava/lang/String;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment$1;->val$requestKey:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/api/apps/AppGetWithUser$AppGetWithUserResponse;)V
    .locals 5
    .param p1, "result"    # Lcom/vkontakte/android/api/apps/AppGetWithUser$AppGetWithUserResponse;

    .prologue
    .line 59
    iget-object v0, p1, Lcom/vkontakte/android/api/apps/AppGetWithUser$AppGetWithUserResponse;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    iget-object v1, p1, Lcom/vkontakte/android/api/apps/AppGetWithUser$AppGetWithUserResponse;->user:Lcom/vkontakte/android/UserProfile;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment$1;->val$message:Ljava/lang/String;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment$1;->val$requestKey:Ljava/lang/String;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment$1;->fragment:Landroid/app/Fragment;

    invoke-static {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->showForResult(Lcom/vkontakte/android/data/ApiApplication;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;Ljava/lang/String;Landroid/app/Fragment;)V

    .line 60
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 56
    check-cast p1, Lcom/vkontakte/android/api/apps/AppGetWithUser$AppGetWithUserResponse;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment$1;->success(Lcom/vkontakte/android/api/apps/AppGetWithUser$AppGetWithUserResponse;)V

    return-void
.end method
