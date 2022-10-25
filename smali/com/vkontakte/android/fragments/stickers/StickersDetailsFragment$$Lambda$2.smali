.class final synthetic Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;)Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$$Lambda$2;-><init>(Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;)V

    return-object v0
.end method


# virtual methods
.method public onSuccess(Ljava/lang/Object;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;

    check-cast p1, Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->lambda$onClick$1(Lcom/vkontakte/android/data/orm/StickerStockItem;)V

    return-void
.end method
