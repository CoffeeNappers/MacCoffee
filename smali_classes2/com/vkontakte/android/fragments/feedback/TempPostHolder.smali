.class Lcom/vkontakte/android/fragments/feedback/TempPostHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "TempPostHolder.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/api/models/Notification;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 0
    .param p1, "itemView"    # Landroid/view/View;

    .prologue
    .line 22
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/view/View;)V

    .line 23
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/api/models/Notification;)V
    .locals 0
    .param p1, "item"    # Lcom/vkontakte/android/api/models/Notification;

    .prologue
    .line 28
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 19
    check-cast p1, Lcom/vkontakte/android/api/models/Notification;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;->onBind(Lcom/vkontakte/android/api/models/Notification;)V

    return-void
.end method

.method public onClick()V
    .locals 2

    .prologue
    .line 32
    new-instance v1, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/Notification;

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->parentPost:Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v1, v0}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->go(Landroid/content/Context;)Z

    .line 33
    return-void
.end method
