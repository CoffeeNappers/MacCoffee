.class public Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "BoardTopicsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;
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
    .line 44
    const-class v0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "group_id"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 46
    return-void
.end method
