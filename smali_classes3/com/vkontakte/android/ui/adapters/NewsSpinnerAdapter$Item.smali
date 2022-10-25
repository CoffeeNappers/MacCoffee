.class public Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;
.super Ljava/lang/Object;
.source "NewsSpinnerAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Item"
.end annotation


# instance fields
.field final checkTitle:Ljava/lang/String;

.field final checked:I

.field final iconRes:I
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation
.end field

.field public final listItem:Lcom/vkontakte/android/NewsfeedList;

.field onCheckedChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/NewsfeedList;I)V
    .locals 2
    .param p1, "listItem"    # Lcom/vkontakte/android/NewsfeedList;
    .param p2, "iconRes"    # I

    .prologue
    const/4 v1, 0x0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;->listItem:Lcom/vkontakte/android/NewsfeedList;

    .line 44
    iput p2, p0, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;->iconRes:I

    .line 45
    iput-object v1, p0, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;->checkTitle:Ljava/lang/String;

    .line 46
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;->checked:I

    .line 47
    iput-object v1, p0, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;->onCheckedChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    .line 48
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/NewsfeedList;ILjava/lang/String;ZLandroid/widget/CompoundButton$OnCheckedChangeListener;)V
    .locals 1
    .param p1, "listItem"    # Lcom/vkontakte/android/NewsfeedList;
    .param p2, "iconRes"    # I
    .param p3, "checkTitle"    # Ljava/lang/String;
    .param p4, "checked"    # Z
    .param p5, "onCheckedChangeListener"    # Landroid/widget/CompoundButton$OnCheckedChangeListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;->listItem:Lcom/vkontakte/android/NewsfeedList;

    .line 53
    iput p2, p0, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;->iconRes:I

    .line 54
    iput-object p3, p0, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;->checkTitle:Ljava/lang/String;

    .line 55
    if-eqz p4, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput v0, p0, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;->checked:I

    .line 56
    iput-object p5, p0, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;->onCheckedChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    .line 57
    return-void

    .line 55
    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;->listItem:Lcom/vkontakte/android/NewsfeedList;

    invoke-virtual {v0}, Lcom/vkontakte/android/NewsfeedList;->getTitle()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
