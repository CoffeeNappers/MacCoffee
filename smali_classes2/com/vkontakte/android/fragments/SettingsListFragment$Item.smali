.class public Lcom/vkontakte/android/fragments/SettingsListFragment$Item;
.super Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder$IconPrefInfo;
.source "SettingsListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/SettingsListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Item"
.end annotation


# instance fields
.field public fragment:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Fragment;",
            ">;"
        }
    .end annotation
.end field

.field public navigator:Lcom/vkontakte/android/navigation/Navigator;

.field public onClick:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(IILjava/lang/Object;Lcom/vkontakte/android/navigation/Navigator;)V
    .locals 0
    .param p1, "iconRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .param p2, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param
    .param p3, "text"    # Ljava/lang/Object;
    .param p4, "navigator"    # Lcom/vkontakte/android/navigation/Navigator;

    .prologue
    .line 349
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder$IconPrefInfo;-><init>(IILjava/lang/Object;)V

    .line 350
    iput-object p4, p0, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;->navigator:Lcom/vkontakte/android/navigation/Navigator;

    .line 351
    return-void
.end method

.method public constructor <init>(IILjava/lang/Object;Ljava/lang/Class;)V
    .locals 0
    .param p1, "iconRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .param p2, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param
    .param p3, "text"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Fragment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 344
    .local p4, "fragment":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Fragment;>;"
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder$IconPrefInfo;-><init>(IILjava/lang/Object;)V

    .line 345
    iput-object p4, p0, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;->fragment:Ljava/lang/Class;

    .line 346
    return-void
.end method

.method public constructor <init>(IILjava/lang/Object;Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "iconRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .param p2, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param
    .param p3, "text"    # Ljava/lang/Object;
    .param p4, "onClick"    # Ljava/lang/Runnable;

    .prologue
    .line 354
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder$IconPrefInfo;-><init>(IILjava/lang/Object;)V

    .line 355
    iput-object p4, p0, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;->onClick:Ljava/lang/Runnable;

    .line 356
    return-void
.end method
