.class final synthetic Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/attachpicker/SelectionContext$SelectionCallback;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$$Lambda$1;->arg$1:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;)Lcom/vk/attachpicker/SelectionContext$SelectionCallback;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$$Lambda$1;-><init>(Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;)V

    return-object v0
.end method


# virtual methods
.method public onSelect(I)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$$Lambda$1;->arg$1:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->lambda$setupRecyclerView$0(I)V

    return-void
.end method
