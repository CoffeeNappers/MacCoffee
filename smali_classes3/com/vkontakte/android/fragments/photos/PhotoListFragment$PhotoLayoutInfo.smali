.class Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;
.super Ljava/lang/Object;
.source "PhotoListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/photos/PhotoListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PhotoLayoutInfo"
.end annotation


# instance fields
.field public height:I

.field public photo:Lcom/vkontakte/android/Photo;

.field public scaledWidth:I

.field public spanSize:I

.field final synthetic this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)V
    .locals 0

    .prologue
    .line 640
    iput-object p1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment$1;

    .prologue
    .line 640
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;-><init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)V

    return-void
.end method
