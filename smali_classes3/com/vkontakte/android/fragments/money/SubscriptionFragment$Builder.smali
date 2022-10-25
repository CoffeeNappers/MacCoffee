.class public Lcom/vkontakte/android/fragments/money/SubscriptionFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "SubscriptionFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/money/SubscriptionFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# direct methods
.method public constructor <init>(I)V
    .locals 2
    .param p1, "id"    # I

    .prologue
    .line 49
    const-class v0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 50
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "subscription_id"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 51
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/data/Subscription;)V
    .locals 2
    .param p1, "subscription"    # Lcom/vkontakte/android/data/Subscription;

    .prologue
    .line 44
    const-class v0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "subscription"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 46
    return-void
.end method
