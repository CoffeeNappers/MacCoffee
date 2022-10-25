.class Lcom/vkontakte/android/ui/MentionsManager$1;
.super Ljava/lang/Object;
.source "MentionsManager.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/MentionsManager;-><init>(Lcom/vkontakte/android/ui/widget/RichEditText;Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/MentionsManager;

.field final synthetic val$editText:Lcom/vkontakte/android/ui/widget/RichEditText;

.field final synthetic val$suggestionsSupplier:Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/MentionsManager;Lcom/vkontakte/android/ui/widget/RichEditText;Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/MentionsManager;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/vkontakte/android/ui/MentionsManager$1;->this$0:Lcom/vkontakte/android/ui/MentionsManager;

    iput-object p2, p0, Lcom/vkontakte/android/ui/MentionsManager$1;->val$editText:Lcom/vkontakte/android/ui/widget/RichEditText;

    iput-object p3, p0, Lcom/vkontakte/android/ui/MentionsManager$1;->val$suggestionsSupplier:Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 18
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 80
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/ui/MentionsManager$1;->this$0:Lcom/vkontakte/android/ui/MentionsManager;

    invoke-static {v13}, Lcom/vkontakte/android/ui/MentionsManager;->access$300(Lcom/vkontakte/android/ui/MentionsManager;)Ljava/lang/String;

    move-result-object v3

    .line 82
    .local v3, "currentWord":Ljava/lang/String;
    const-string/jumbo v13, "MentionsManager"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "afterTextChanged, currentWord = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    const-string/jumbo v13, "@"

    invoke-virtual {v3, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_0

    const-string/jumbo v13, "*"

    invoke-virtual {v3, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 85
    :cond_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/ui/MentionsManager$1;->val$suggestionsSupplier:Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;

    const/4 v14, 0x1

    invoke-virtual {v3, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    invoke-interface {v13, v14}, Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;->showMentionSuggestionsFor(Ljava/lang/String;)V

    .line 86
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/ui/MentionsManager$1;->this$0:Lcom/vkontakte/android/ui/MentionsManager;

    invoke-static {v13}, Lcom/vkontakte/android/ui/MentionsManager;->access$000(Lcom/vkontakte/android/ui/MentionsManager;)[I

    move-result-object v2

    .line 87
    .local v2, "boundaries":[I
    const/4 v13, 0x0

    aget v13, v2, v13

    const/4 v14, 0x1

    aget v14, v2, v14

    const-class v15, Lcom/vkontakte/android/ui/MentionSpan;

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14, v15}, Landroid/text/Editable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Lcom/vkontakte/android/ui/MentionSpan;

    .line 88
    .local v9, "spans":[Lcom/vkontakte/android/ui/MentionSpan;
    array-length v14, v9

    const/4 v13, 0x0

    :goto_0
    if-ge v13, v14, :cond_1

    aget-object v8, v9, v13

    .line 89
    .local v8, "span":Lcom/vkontakte/android/ui/MentionSpan;
    move-object/from16 v0, p1

    invoke-interface {v0, v8}, Landroid/text/Editable;->removeSpan(Ljava/lang/Object;)V

    .line 88
    add-int/lit8 v13, v13, 0x1

    goto :goto_0

    .line 92
    .end local v8    # "span":Lcom/vkontakte/android/ui/MentionSpan;
    :cond_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/ui/MentionsManager$1;->val$suggestionsSupplier:Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;

    const/4 v14, 0x1

    invoke-virtual {v3, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    invoke-interface {v13, v14}, Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;->findExactMatch(Ljava/lang/String;)I

    move-result v5

    .line 93
    .local v5, "id":I
    if-eqz v5, :cond_2

    .line 94
    new-instance v8, Lcom/vkontakte/android/ui/MentionSpan;

    invoke-direct {v8}, Lcom/vkontakte/android/ui/MentionSpan;-><init>()V

    .line 95
    .restart local v8    # "span":Lcom/vkontakte/android/ui/MentionSpan;
    iput v5, v8, Lcom/vkontakte/android/ui/MentionSpan;->id:I

    .line 96
    const/4 v13, 0x0

    aget v13, v2, v13

    const/4 v14, 0x1

    aget v14, v2, v14

    const/16 v15, 0x21

    move-object/from16 v0, p1

    invoke-interface {v0, v8, v13, v14, v15}, Landroid/text/Editable;->setSpan(Ljava/lang/Object;III)V

    .line 145
    .end local v2    # "boundaries":[I
    .end local v5    # "id":I
    .end local v8    # "span":Lcom/vkontakte/android/ui/MentionSpan;
    :cond_2
    :goto_1
    return-void

    .line 100
    .end local v9    # "spans":[Lcom/vkontakte/android/ui/MentionSpan;
    :cond_3
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/ui/MentionsManager$1;->val$suggestionsSupplier:Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;

    invoke-interface {v13}, Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;->hideMentionSuggestions()V

    .line 102
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/ui/MentionsManager$1;->this$0:Lcom/vkontakte/android/ui/MentionsManager;

    invoke-static {v13}, Lcom/vkontakte/android/ui/MentionsManager;->access$000(Lcom/vkontakte/android/ui/MentionsManager;)[I

    move-result-object v6

    .line 103
    .local v6, "ind":[I
    const-string/jumbo v13, "MentionsManager"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "Current word ["

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/4 v15, 0x0

    aget v15, v6, v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, ","

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/4 v15, 0x1

    aget v15, v6, v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, "]"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    const/4 v13, 0x0

    aget v13, v6, v13

    const/4 v14, 0x1

    aget v14, v6, v14

    const-class v15, Lcom/vkontakte/android/ui/MentionSpan;

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14, v15}, Landroid/text/Editable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Lcom/vkontakte/android/ui/MentionSpan;

    .line 105
    .restart local v9    # "spans":[Lcom/vkontakte/android/ui/MentionSpan;
    const-string/jumbo v13, "MentionsManager"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "totally "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    array-length v15, v9

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, " spans"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    array-length v13, v9

    if-nez v13, :cond_4

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/ui/MentionsManager$1;->this$0:Lcom/vkontakte/android/ui/MentionsManager;

    .line 108
    invoke-static {v13}, Lcom/vkontakte/android/ui/MentionsManager;->access$100(Lcom/vkontakte/android/ui/MentionsManager;)Lcom/vkontakte/android/ui/MentionSpan;

    move-result-object v13

    if-eqz v13, :cond_4

    const/4 v13, 0x0

    aget v13, v6, v13

    const/4 v14, 0x1

    aget v14, v6, v14

    if-ge v13, v14, :cond_4

    .line 109
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/ui/MentionsManager$1;->this$0:Lcom/vkontakte/android/ui/MentionsManager;

    invoke-static {v13}, Lcom/vkontakte/android/ui/MentionsManager;->access$200(Lcom/vkontakte/android/ui/MentionsManager;)J

    move-result-wide v16

    sub-long v14, v14, v16

    const-wide/16 v16, 0x12c

    cmp-long v13, v14, v16

    if-gez v13, :cond_4

    .line 115
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/ui/MentionsManager$1;->this$0:Lcom/vkontakte/android/ui/MentionsManager;

    invoke-static {v13}, Lcom/vkontakte/android/ui/MentionsManager;->access$100(Lcom/vkontakte/android/ui/MentionsManager;)Lcom/vkontakte/android/ui/MentionSpan;

    move-result-object v13

    const/4 v14, 0x0

    aget v14, v6, v14

    const/4 v15, 0x1

    aget v15, v6, v15

    const/16 v16, 0x21

    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-interface {v0, v13, v14, v15, v1}, Landroid/text/Editable;->setSpan(Ljava/lang/Object;III)V

    .line 116
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/ui/MentionsManager$1;->this$0:Lcom/vkontakte/android/ui/MentionsManager;

    const/4 v14, 0x0

    invoke-static {v13, v14}, Lcom/vkontakte/android/ui/MentionsManager;->access$102(Lcom/vkontakte/android/ui/MentionsManager;Lcom/vkontakte/android/ui/MentionSpan;)Lcom/vkontakte/android/ui/MentionSpan;

    goto/16 :goto_1

    .line 118
    :cond_4
    array-length v13, v9

    const/4 v14, 0x1

    if-ne v13, v14, :cond_6

    .line 120
    const/4 v13, 0x0

    aget-object v8, v9, v13

    .line 121
    .restart local v8    # "span":Lcom/vkontakte/android/ui/MentionSpan;
    move-object/from16 v0, p1

    invoke-interface {v0, v8}, Landroid/text/Editable;->getSpanStart(Ljava/lang/Object;)I

    move-result v10

    .line 122
    .local v10, "start":I
    move-object/from16 v0, p1

    invoke-interface {v0, v8}, Landroid/text/Editable;->getSpanEnd(Ljava/lang/Object;)I

    move-result v4

    .line 124
    .local v4, "end":I
    const/4 v13, 0x0

    aget v12, v6, v13

    .line 125
    .local v12, "updatedStart":I
    const/4 v13, 0x1

    aget v11, v6, v13

    .line 127
    .local v11, "updatedEnd":I
    const-string/jumbo v13, "MentionsManager"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "start = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, ", end = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, ", updatedStart = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, " updatedEnd = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    if-lt v12, v10, :cond_5

    if-le v11, v4, :cond_2

    .line 130
    :cond_5
    move-object/from16 v0, p1

    invoke-interface {v0, v8}, Landroid/text/Editable;->removeSpan(Ljava/lang/Object;)V

    .line 131
    const/16 v13, 0x21

    move-object/from16 v0, p1

    invoke-interface {v0, v8, v12, v11, v13}, Landroid/text/Editable;->setSpan(Ljava/lang/Object;III)V

    goto/16 :goto_1

    .line 134
    .end local v4    # "end":I
    .end local v8    # "span":Lcom/vkontakte/android/ui/MentionSpan;
    .end local v10    # "start":I
    .end local v11    # "updatedEnd":I
    .end local v12    # "updatedStart":I
    :cond_6
    array-length v13, v9

    const/4 v14, 0x1

    if-le v13, v14, :cond_2

    .line 139
    array-length v14, v9

    const/4 v13, 0x0

    :goto_2
    if-ge v13, v14, :cond_2

    aget-object v7, v9, v13

    .line 140
    .local v7, "ms":Lcom/vkontakte/android/ui/MentionSpan;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/MentionsManager$1;->val$editText:Lcom/vkontakte/android/ui/widget/RichEditText;

    invoke-virtual {v15}, Lcom/vkontakte/android/ui/widget/RichEditText;->getEditableText()Landroid/text/Editable;

    move-result-object v15

    invoke-interface {v15, v7}, Landroid/text/Editable;->removeSpan(Ljava/lang/Object;)V

    .line 139
    add-int/lit8 v13, v13, 0x1

    goto :goto_2
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 8
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 57
    const-string/jumbo v2, "MentionsManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "beforeTextChanged, s = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ", start = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ", count = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ", after = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    iget-object v2, p0, Lcom/vkontakte/android/ui/MentionsManager$1;->this$0:Lcom/vkontakte/android/ui/MentionsManager;

    invoke-static {v2}, Lcom/vkontakte/android/ui/MentionsManager;->access$000(Lcom/vkontakte/android/ui/MentionsManager;)[I

    move-result-object v0

    .line 60
    .local v0, "ind":[I
    if-nez p4, :cond_0

    if-lez p3, :cond_0

    aget v2, v0, v6

    if-ne p2, v2, :cond_0

    add-int v2, p2, p3

    aget v3, v0, v7

    if-ne v2, v3, :cond_0

    .line 62
    iget-object v2, p0, Lcom/vkontakte/android/ui/MentionsManager$1;->val$editText:Lcom/vkontakte/android/ui/widget/RichEditText;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/widget/RichEditText;->getEditableText()Landroid/text/Editable;

    move-result-object v2

    aget v3, v0, v6

    aget v4, v0, v7

    const-class v5, Lcom/vkontakte/android/ui/MentionSpan;

    invoke-interface {v2, v3, v4, v5}, Landroid/text/Editable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/vkontakte/android/ui/MentionSpan;

    .line 63
    .local v1, "spans":[Lcom/vkontakte/android/ui/MentionSpan;
    array-length v2, v1

    if-ne v2, v7, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/ui/MentionsManager$1;->val$editText:Lcom/vkontakte/android/ui/widget/RichEditText;

    .line 64
    invoke-virtual {v2}, Lcom/vkontakte/android/ui/widget/RichEditText;->getEditableText()Landroid/text/Editable;

    move-result-object v2

    aget-object v3, v1, v6

    invoke-interface {v2, v3}, Landroid/text/Editable;->getSpanStart(Ljava/lang/Object;)I

    move-result v2

    if-ne v2, p2, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/ui/MentionsManager$1;->val$editText:Lcom/vkontakte/android/ui/widget/RichEditText;

    .line 65
    invoke-virtual {v2}, Lcom/vkontakte/android/ui/widget/RichEditText;->getEditableText()Landroid/text/Editable;

    move-result-object v2

    aget-object v3, v1, v6

    invoke-interface {v2, v3}, Landroid/text/Editable;->getSpanEnd(Ljava/lang/Object;)I

    move-result v2

    add-int v3, p2, p3

    if-ne v2, v3, :cond_0

    .line 67
    iget-object v2, p0, Lcom/vkontakte/android/ui/MentionsManager$1;->this$0:Lcom/vkontakte/android/ui/MentionsManager;

    aget-object v3, v1, v6

    invoke-static {v2, v3}, Lcom/vkontakte/android/ui/MentionsManager;->access$102(Lcom/vkontakte/android/ui/MentionsManager;Lcom/vkontakte/android/ui/MentionSpan;)Lcom/vkontakte/android/ui/MentionSpan;

    .line 68
    iget-object v2, p0, Lcom/vkontakte/android/ui/MentionsManager$1;->this$0:Lcom/vkontakte/android/ui/MentionsManager;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v2, v4, v5}, Lcom/vkontakte/android/ui/MentionsManager;->access$202(Lcom/vkontakte/android/ui/MentionsManager;J)J

    .line 71
    .end local v1    # "spans":[Lcom/vkontakte/android/ui/MentionSpan;
    :cond_0
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 3
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 75
    const-string/jumbo v0, "MentionsManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onTextChanged, s = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", start = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", before = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", count = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    return-void
.end method
