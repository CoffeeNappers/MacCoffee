.class public abstract Lcom/vkontakte/android/ui/PagerAdapter;
.super Ljava/lang/Object;
.source "PagerAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/PagerAdapter$DataSetObserver;
    }
.end annotation


# static fields
.field public static final POSITION_NONE:I = -0x2

.field public static final POSITION_UNCHANGED:I = -0x1


# instance fields
.field private mObserver:Lcom/vkontakte/android/ui/PagerAdapter$DataSetObserver;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract destroyItem(Landroid/view/View;ILjava/lang/Object;)V
.end method

.method public abstract finishUpdate(Landroid/view/View;)V
.end method

.method public abstract getCount()I
.end method

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 113
    const/4 v0, -0x1

    return v0
.end method

.method public abstract instantiateItem(Landroid/view/View;I)Ljava/lang/Object;
.end method

.method public abstract isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
.end method

.method public notifyDataSetChanged()V
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lcom/vkontakte/android/ui/PagerAdapter;->mObserver:Lcom/vkontakte/android/ui/PagerAdapter$DataSetObserver;

    if-eqz v0, :cond_0

    .line 122
    iget-object v0, p0, Lcom/vkontakte/android/ui/PagerAdapter;->mObserver:Lcom/vkontakte/android/ui/PagerAdapter$DataSetObserver;

    invoke-interface {v0}, Lcom/vkontakte/android/ui/PagerAdapter$DataSetObserver;->onDataSetChanged()V

    .line 124
    :cond_0
    return-void
.end method

.method public abstract restoreState(Landroid/os/Parcelable;Ljava/lang/ClassLoader;)V
.end method

.method public abstract saveState()Landroid/os/Parcelable;
.end method

.method setDataSetObserver(Lcom/vkontakte/android/ui/PagerAdapter$DataSetObserver;)V
    .locals 0
    .param p1, "observer"    # Lcom/vkontakte/android/ui/PagerAdapter$DataSetObserver;

    .prologue
    .line 127
    iput-object p1, p0, Lcom/vkontakte/android/ui/PagerAdapter;->mObserver:Lcom/vkontakte/android/ui/PagerAdapter$DataSetObserver;

    .line 128
    return-void
.end method

.method public abstract startUpdate(Landroid/view/View;)V
.end method
