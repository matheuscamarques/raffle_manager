defmodule RaffleManager.SortitionTest do
  use RaffleManager.DataCase

  alias RaffleManager.Sortition

  describe "sort" do
    alias RaffleManager.Sortition.Sort

    import RaffleManager.SortitionFixtures

    @invalid_attrs %{date_limit: nil, description: nil, name: nil, range_numbers: nil}

    test "list_sort/0 returns all sort" do
      sort = sort_fixture()
      assert Sortition.list_sort() == [sort]
    end

    test "get_sort!/1 returns the sort with given id" do
      sort = sort_fixture()
      assert Sortition.get_sort!(sort.id) == sort
    end

    test "create_sort/1 with valid data creates a sort" do
      valid_attrs = %{date_limit: ~D[2023-10-15], description: "some description", name: "some name", range_numbers: 42}

      assert {:ok, %Sort{} = sort} = Sortition.create_sort(valid_attrs)
      assert sort.date_limit == ~D[2023-10-15]
      assert sort.description == "some description"
      assert sort.name == "some name"
      assert sort.range_numbers == 42
    end

    test "create_sort/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sortition.create_sort(@invalid_attrs)
    end

    test "update_sort/2 with valid data updates the sort" do
      sort = sort_fixture()
      update_attrs = %{date_limit: ~D[2023-10-16], description: "some updated description", name: "some updated name", range_numbers: 43}

      assert {:ok, %Sort{} = sort} = Sortition.update_sort(sort, update_attrs)
      assert sort.date_limit == ~D[2023-10-16]
      assert sort.description == "some updated description"
      assert sort.name == "some updated name"
      assert sort.range_numbers == 43
    end

    test "update_sort/2 with invalid data returns error changeset" do
      sort = sort_fixture()
      assert {:error, %Ecto.Changeset{}} = Sortition.update_sort(sort, @invalid_attrs)
      assert sort == Sortition.get_sort!(sort.id)
    end

    test "delete_sort/1 deletes the sort" do
      sort = sort_fixture()
      assert {:ok, %Sort{}} = Sortition.delete_sort(sort)
      assert_raise Ecto.NoResultsError, fn -> Sortition.get_sort!(sort.id) end
    end

    test "change_sort/1 returns a sort changeset" do
      sort = sort_fixture()
      assert %Ecto.Changeset{} = Sortition.change_sort(sort)
    end
  end

  describe "sort" do
    alias RaffleManager.Sortition.Sort

    import RaffleManager.SortitionFixtures

    @invalid_attrs %{date_limit: nil, description: nil, image: nil, name: nil, range_numbers: nil}

    test "list_sort/0 returns all sort" do
      sort = sort_fixture()
      assert Sortition.list_sort() == [sort]
    end

    test "get_sort!/1 returns the sort with given id" do
      sort = sort_fixture()
      assert Sortition.get_sort!(sort.id) == sort
    end

    test "create_sort/1 with valid data creates a sort" do
      valid_attrs = %{date_limit: ~D[2023-10-15], description: "some description", image: "some image", name: "some name", range_numbers: 42}

      assert {:ok, %Sort{} = sort} = Sortition.create_sort(valid_attrs)
      assert sort.date_limit == ~D[2023-10-15]
      assert sort.description == "some description"
      assert sort.image == "some image"
      assert sort.name == "some name"
      assert sort.range_numbers == 42
    end

    test "create_sort/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sortition.create_sort(@invalid_attrs)
    end

    test "update_sort/2 with valid data updates the sort" do
      sort = sort_fixture()
      update_attrs = %{date_limit: ~D[2023-10-16], description: "some updated description", image: "some updated image", name: "some updated name", range_numbers: 43}

      assert {:ok, %Sort{} = sort} = Sortition.update_sort(sort, update_attrs)
      assert sort.date_limit == ~D[2023-10-16]
      assert sort.description == "some updated description"
      assert sort.image == "some updated image"
      assert sort.name == "some updated name"
      assert sort.range_numbers == 43
    end

    test "update_sort/2 with invalid data returns error changeset" do
      sort = sort_fixture()
      assert {:error, %Ecto.Changeset{}} = Sortition.update_sort(sort, @invalid_attrs)
      assert sort == Sortition.get_sort!(sort.id)
    end

    test "delete_sort/1 deletes the sort" do
      sort = sort_fixture()
      assert {:ok, %Sort{}} = Sortition.delete_sort(sort)
      assert_raise Ecto.NoResultsError, fn -> Sortition.get_sort!(sort.id) end
    end

    test "change_sort/1 returns a sort changeset" do
      sort = sort_fixture()
      assert %Ecto.Changeset{} = Sortition.change_sort(sort)
    end
  end

  describe "sort_number" do
    alias RaffleManager.Sortition.SortNumber

    import RaffleManager.SortitionFixtures

    @invalid_attrs %{number: nil, sort_id: nil, user_id: nil}

    test "list_sort_number/0 returns all sort_number" do
      sort_number = sort_number_fixture()
      assert Sortition.list_sort_number() == [sort_number]
    end

    test "get_sort_number!/1 returns the sort_number with given id" do
      sort_number = sort_number_fixture()
      assert Sortition.get_sort_number!(sort_number.id) == sort_number
    end

    test "create_sort_number/1 with valid data creates a sort_number" do
      valid_attrs = %{number: 42, sort_id: "7488a646-e31f-11e4-aace-600308960662", user_id: "7488a646-e31f-11e4-aace-600308960662"}

      assert {:ok, %SortNumber{} = sort_number} = Sortition.create_sort_number(valid_attrs)
      assert sort_number.number == 42
      assert sort_number.sort_id == "7488a646-e31f-11e4-aace-600308960662"
      assert sort_number.user_id == "7488a646-e31f-11e4-aace-600308960662"
    end

    test "create_sort_number/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sortition.create_sort_number(@invalid_attrs)
    end

    test "update_sort_number/2 with valid data updates the sort_number" do
      sort_number = sort_number_fixture()
      update_attrs = %{number: 43, sort_id: "7488a646-e31f-11e4-aace-600308960668", user_id: "7488a646-e31f-11e4-aace-600308960668"}

      assert {:ok, %SortNumber{} = sort_number} = Sortition.update_sort_number(sort_number, update_attrs)
      assert sort_number.number == 43
      assert sort_number.sort_id == "7488a646-e31f-11e4-aace-600308960668"
      assert sort_number.user_id == "7488a646-e31f-11e4-aace-600308960668"
    end

    test "update_sort_number/2 with invalid data returns error changeset" do
      sort_number = sort_number_fixture()
      assert {:error, %Ecto.Changeset{}} = Sortition.update_sort_number(sort_number, @invalid_attrs)
      assert sort_number == Sortition.get_sort_number!(sort_number.id)
    end

    test "delete_sort_number/1 deletes the sort_number" do
      sort_number = sort_number_fixture()
      assert {:ok, %SortNumber{}} = Sortition.delete_sort_number(sort_number)
      assert_raise Ecto.NoResultsError, fn -> Sortition.get_sort_number!(sort_number.id) end
    end

    test "change_sort_number/1 returns a sort_number changeset" do
      sort_number = sort_number_fixture()
      assert %Ecto.Changeset{} = Sortition.change_sort_number(sort_number)
    end
  end
end
