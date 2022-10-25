.class final synthetic Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$30;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;


# static fields
.field private static final instance:Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$30;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$30;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$30;-><init>()V

    sput-object v0, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$30;->instance:Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$30;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static lambdaFactory$()Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;
    .locals 1

    sget-object v0, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$30;->instance:Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$30;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;Ljava/lang/Object;I)V
    .locals 0
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    check-cast p2, Lcom/vk/music/dto/Playlist;

    invoke-static {p1, p2, p3}, Lcom/vkontakte/android/fragments/ProfileFragment;->lambda$buildInfoItems$29(Landroid/view/View;Lcom/vk/music/dto/Playlist;I)V

    return-void
.end method
