.class public Lcom/vk/emoji/TextViewInvalidator;
.super Ljava/lang/Object;
.source "TextViewInvalidator.java"


# static fields
.field private static editorField:Ljava/lang/reflect/Field;

.field private static invalidateTextDisplayListMethod:Ljava/lang/reflect/Method;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getEditor(Landroid/widget/TextView;)Ljava/lang/Object;
    .locals 2
    .param p0, "textView"    # Landroid/widget/TextView;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 20
    sget-object v0, Lcom/vk/emoji/TextViewInvalidator;->editorField:Ljava/lang/reflect/Field;

    if-nez v0, :cond_0

    .line 21
    const-class v0, Landroid/widget/TextView;

    const-string/jumbo v1, "mEditor"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    sput-object v0, Lcom/vk/emoji/TextViewInvalidator;->editorField:Ljava/lang/reflect/Field;

    .line 22
    sget-object v0, Lcom/vk/emoji/TextViewInvalidator;->editorField:Ljava/lang/reflect/Field;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 24
    :cond_0
    sget-object v0, Lcom/vk/emoji/TextViewInvalidator;->editorField:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static invalidate(Landroid/widget/TextView;)V
    .locals 4
    .param p0, "textView"    # Landroid/widget/TextView;

    .prologue
    .line 36
    if-nez p0, :cond_0

    .line 53
    :goto_0
    return-void

    .line 40
    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/vk/emoji/TextViewInvalidator;->getEditor(Landroid/widget/TextView;)Ljava/lang/Object;

    move-result-object v1

    .line 41
    .local v1, "editor":Ljava/lang/Object;
    if-nez v1, :cond_1

    .line 42
    invoke-virtual {p0}, Landroid/widget/TextView;->invalidate()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 47
    .end local v1    # "editor":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 49
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p0}, Landroid/widget/TextView;->isEnabled()Z

    move-result v2

    .line 50
    .local v2, "enabled":Z
    if-nez v2, :cond_2

    const/4 v3, 0x1

    :goto_1
    invoke-virtual {p0, v3}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 51
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setEnabled(Z)V

    goto :goto_0

    .line 44
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "enabled":Z
    .restart local v1    # "editor":Ljava/lang/Object;
    :cond_1
    :try_start_1
    invoke-static {v1}, Lcom/vk/emoji/TextViewInvalidator;->invokeInvalidate(Ljava/lang/Object;)V

    .line 45
    invoke-virtual {p0}, Landroid/widget/TextView;->invalidate()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 50
    .end local v1    # "editor":Ljava/lang/Object;
    .restart local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "enabled":Z
    :cond_2
    const/4 v3, 0x0

    goto :goto_1
.end method

.method private static invokeInvalidate(Ljava/lang/Object;)V
    .locals 4
    .param p0, "editor"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 28
    sget-object v0, Lcom/vk/emoji/TextViewInvalidator;->invalidateTextDisplayListMethod:Ljava/lang/reflect/Method;

    if-nez v0, :cond_0

    .line 29
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string/jumbo v1, "invalidateTextDisplayList"

    new-array v2, v3, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/vk/emoji/TextViewInvalidator;->invalidateTextDisplayListMethod:Ljava/lang/reflect/Method;

    .line 30
    sget-object v0, Lcom/vk/emoji/TextViewInvalidator;->invalidateTextDisplayListMethod:Ljava/lang/reflect/Method;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 32
    :cond_0
    sget-object v0, Lcom/vk/emoji/TextViewInvalidator;->invalidateTextDisplayListMethod:Ljava/lang/reflect/Method;

    new-array v1, v3, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    return-void
.end method
