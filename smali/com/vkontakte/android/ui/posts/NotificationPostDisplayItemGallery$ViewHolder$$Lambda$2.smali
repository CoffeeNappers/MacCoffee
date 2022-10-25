.class final synthetic Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$$Lambda$2;->arg$1:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;)Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$$Lambda$2;-><init>(Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;)V

    return-object v0
.end method


# virtual methods
.method public onLoaded(Ljava/util/ArrayList;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$$Lambda$2;->arg$1:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->lambda$loadMediaStore$1(Ljava/util/ArrayList;)V

    return-void
.end method
