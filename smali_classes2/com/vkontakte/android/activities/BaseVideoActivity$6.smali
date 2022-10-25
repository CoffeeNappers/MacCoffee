.class Lcom/vkontakte/android/activities/BaseVideoActivity$6;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "BaseVideoActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/BaseVideoActivity;->updateAddedState()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/activities/BaseVideoActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/BaseVideoActivity;

    .prologue
    .line 460
    iput-object p1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$6;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public success(Ljava/lang/Boolean;)V
    .locals 2
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    .line 463
    iget-object v1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$6;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput v0, v1, Lcom/vkontakte/android/activities/BaseVideoActivity;->addedID:I

    .line 464
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$6;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->invalidateOptionsMenu()V

    .line 465
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$6;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->onAddedStateChanged()V

    .line 466
    return-void

    .line 463
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 460
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/activities/BaseVideoActivity$6;->success(Ljava/lang/Boolean;)V

    return-void
.end method
