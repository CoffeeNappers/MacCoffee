.class public Lcom/vk/stories/StoriesFilterListFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "StoriesFilterListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/StoriesFilterListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 25
    const-class v0, Lcom/vk/stories/StoriesFilterListFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 26
    iget-object v0, p0, Lcom/vk/stories/StoriesFilterListFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "theme"

    const v2, 0x7f0b00b7

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 27
    return-void
.end method
