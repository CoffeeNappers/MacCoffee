.class Lcom/vkontakte/android/fragments/location/CheckInFragment$3;
.super Ljava/lang/Object;
.source "CheckInFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/location/CheckInFragment;->initToolbar()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/location/CheckInFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/location/CheckInFragment;

    .prologue
    .line 345
    iput-object p1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$3;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onQueryChanged(Ljava/lang/String;)V
    .locals 2
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 359
    iget-object v1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$3;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->setSearchMode(Z)V

    .line 360
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$3;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->updateList()V

    .line 361
    return-void

    .line 359
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onQueryConfirmed(Ljava/lang/String;)V
    .locals 1
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 348
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$3;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iput-object p1, v0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mQuery:Ljava/lang/String;

    .line 349
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$3;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->loadData()V

    .line 350
    return-void
.end method

.method public onQuerySubmitted(Ljava/lang/String;)V
    .locals 0
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 355
    return-void
.end method
